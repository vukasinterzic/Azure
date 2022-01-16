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

#Get all VMs that should be part of the Schedule:
#List VMs in all subscriptions:

$Subscriptions = Get-AzSubscription | Where-Object Name -notlike 'Access to Azure Active Directory'


# Make demo more simple. You just need to process one subscription. You can add subscription switch later.
# I need to work with a keyvault. I'm not sure if that will work if i switch subscription. Therefore you need to think about that and maybe save the values before creating variables.

#For this to work accross subscriptions, RunAsAccount needs to get assigned role. Currently it has assigned VM Contributor to Management Group Prod.

foreach ($subscription in $Subscriptions) {

    $VMs = @()

    Write-Output "Selecting Subscription $($Subscription.Name)... "

    Get-AzSubscription -SubscriptionName $Subscription.Name | Set-AZContext

    $VMs +=  Get-AzResource -ResourceType "Microsoft.Compute/VirtualMachines" -TagName "VMPasswordReset" -TagValue "Yes"


    IF (!$VMs) { Write-Output "No VMs with enabled password reset in this subscription." }

    foreach ($VM in $VMs) {

        Write-Output "Processing VM $($VM.Name)..."
    

        #TODO: Add action

    } #End of VMs in Subscription

} # End of Subscriptions
 
 Write-Output "Runbook completed."