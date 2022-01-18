#Reset VM password and save it to KeyVault

#FIXME Add logging option, save logs to a storage account!!!!

Write-Output "Logging into Azure subscription using Az cmdlets..."
    
# Ensures you do not inherit an AzContext in your runbook
#Disable-AzContextAutosave -Scope Process

$connectionName = "AzureRunAsConnection"
try
{
    # Get the connection "AzureRunAsConnection "
    $servicePrincipalConnection=Get-AutomationConnection -Name $connectionName         

    Add-AzAccount `
        -ServicePrincipal `
        -TenantId $servicePrincipalConnection.TenantId `
        -ApplicationId $servicePrincipalConnection.ApplicationId `
        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 
    
    Write-Output "Successfully logged into Azure subscription using Az cmdlets..."
}

catch {
    if (!$servicePrincipalConnection)
    {
        $ErrorMessage = "Connection $connectionName not found."
        throw $ErrorMessage
    } else{
        Write-Error -Message $_.Exception
        throw $_.Exception
    }
}


#Define variables

$KeyVaultName = "KV-AutomationTest"
$KeyVaultSubscriptionName = "Microsoft Azure Sponsorship"
$SecretsHolder = @()

#Get all VMs that should be part of the Schedule:
#List VMs in all subscriptions:

$Subscriptions = Get-AzSubscription | Where-Object Name -notlike 'Access to Azure Active Directory'


foreach ($Subscription in $Subscriptions) {

    $VMs = @()

    Write-Output "Selecting Subscription $($Subscription.Name)... "

    Get-AzSubscription -SubscriptionName $Subscription.Name | Set-AZContext

    $VMs +=  Get-AzResource -ResourceType "Microsoft.Compute/VirtualMachines" -TagName "VMPasswordReset" -TagValue "Yes"


    IF (!$VMs) { Write-Output "No VMs with enabled password reset in this subscription." }

    foreach ($VM in $VMs) {

        Write-Output "Processing VM $($VM.Name)..."

        $VMInfo = Get-AzVM -Name $VM.Name -ResourceGroupName $VM.ResourceGroupName

        if ($VMInfo) {

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
            Write-Output "VM $($VM.Name) not found."
        }

    } #End of VMs in Subscription

} # End of Subscriptions


#Switching to KeyVault subscription to save secrets

Get-AzSubscription -SubscriptionName $KeyVaultSubscriptionName | Set-AZContext

#Save password to KeyVault
Write-Output "Saving passwords to KeyVault..."
foreach ($s in $SecretsHolder) {

    Write-Output "Saving secret $($s.SecretName)..."
    Set-AzKeyVaultSecret -VaultName $KeyVaultName -SecretName $s.SecretName -SecretValue $s.SecretValue

}
 
 Write-Output "Runbook completed."