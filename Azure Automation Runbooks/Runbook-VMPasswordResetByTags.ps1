#Reset VM password and save it to KeyVault

#FIXME Add logging option, save logs to a storage account!!!!

Write-Output "Connecting ..."
    
# Ensures you do not inherit an AzContext in your runbook
Disable-AzContextAutosave -Scope Process

# Connect to Azure with system-assigned managed identity
$AzureContext = (Connect-AzAccount -Identity).context

# Set and store context
$AzureContext = Set-AzContext -SubscriptionName $AzureContext.Subscription -DefaultProfile $AzureContext   


#Define variables

Write-Output "Defining variables ..."

$KeyVaultName = "KV-AutomationTest"
$KeyVaultSubscriptionName = "Microsoft Azure Sponsorship"
$SecretsHolder = @()

Write-Output "Getting the list of all subscriptions...."

$Subscriptions = Get-AzSubscription | Where-Object Name -notlike 'Access to Azure Active Directory'

Write-Output "Start Subscription loop..."
foreach ($Subscription in $Subscriptions) {

    $VMs = @()

    Write-Output "Selecting Subscription $($Subscription.Name)... "

    Get-AzSubscription -SubscriptionName $Subscription.Name | Set-AZContext

    $VMs +=  Get-AzResource -ResourceType "Microsoft.Compute/VirtualMachines" -TagName "VMPasswordReset" -TagValue "Yes"


    IF (!$VMs) { 
        Write-Output "No VMs with enabled password reset in this subscription." 
    } else {
        Write-Output "VMs found. Staring the VM loop..."
    }

    foreach ($VM in $VMs) {

        Write-Output "Processing VM $($VM.Name)..."

        $VMInfo = Get-AzVM -Name $VM.Name -ResourceGroupName $VM.ResourceGroupName

        $VMStatus = ($VMinfo.Statuses | Where-Object Code -like "*PowerState*").DisplayStatus

        if ($VMStatus -eq "Running") {

            #Generate a new password
            $CharArray = "!@#$%^&*0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz!@#$%^&*".tochararray()
            $Password = ConvertTo-SecureString (($CharArray | Get-Random -Count 18) -join '') -AsPlainText -Force

            #Secret Name will be in the format of "VM Name - Admin User Name"
            $KeyVaultSecretName = $VMInfo.Name + "-" + $VMInfo.OSProfile.AdminUsername

            $VMReset = @{
                VMName = $VMInfo.Name
                ResourceGroupName = $VMInfo.ResourceGroupName
                Location = $VMInfo.Location
                Credential = New-Object System.Management.Automation.PSCredential ($VMInfo.OSProfile.AdminUsername, $Password)
            }


            Write-Output "Resetting password for VM $($VM.Name)..." 
            Set-AzVMAccessExtension @VMReset -typeHandlerVersion "2.0" -Name VMAccessAgent

            #Add secret to object array
            $secret = new-object -TypeName psobject
            $secret | Add-Member -MemberType NoteProperty -Name SecretName -Value $KeyVaultSecretName
            $secret | Add-Member -MemberType NoteProperty -Name SecretValue -Value $Password
            $SecretsHolder += $secret

        } else {
            Write-Output "VM ($VM.Name) is not running. Skipping..."
        }

    } #End of VMs in Subscription loop

} # End of Subscriptions loop


if ((Get-AzContext).Subscription.Name -ne $KeyVaultSubscriptionName) {
    
    Write-Output "Switching to Subscription where the KeyVault is..."
    Get-AzSubscription -SubscriptionName $KeyVaultSubscriptionName | Set-AZContext

}

#Save password to KeyVault
Write-Output "Saving passwords to KeyVault..."
foreach ($s in $SecretsHolder) {

    Write-Output "Saving secret $($s.SecretName)..."
    Set-AzKeyVaultSecret -VaultName $KeyVaultName -SecretName $s.SecretName -SecretValue $s.SecretValue

}
 
 Write-Output "Runbook completed."