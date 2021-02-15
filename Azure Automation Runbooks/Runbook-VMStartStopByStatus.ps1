Param  
(  
    [Parameter (Mandatory = $false)]  
    [object] $WebhookData  
)  
 
# If runbook was called from Webhook, WebhookData will not be null.  
if ($WebhookData) { 

    Write-Output "Logging into Azure subscription using Az cmdlets..."
        
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

    Write-Output "Hello I am connected now ..."

    # Get VM info from the $WebhookData
    $VMs = (ConvertFrom-Json -InputObject $WebhookData.RequestBody)


    foreach ($VM in $VMs) {
        
        #Get VM PowerState:
        $VMObject = Get-AzVm -ResourceGroupName $VM.RGName -Name $VM.VMName -Status
        $VMStatus = ($VMObject.Statuses | Where-Object Code -like "*PowerState*").DisplayStatus

        Write-Output = "PowerState of VM $($VM.VMName) is: $VMStatus"
        
        if ($VMStatus -like "*deallocated") {

          Write-Output "VM status for $($VMObject.Name) is $VMStatus. Starting VM..."

          Start-AzVM -Name $VMObject.Name -ResourceGroupName $VMObject.ResourceGroupName

        } elseif (($VMStatus -like "*running") -OR ($VMStatus -like "*stopped")) { #Running VMs, or VMs that are turned off from OS but still allocated

          Write-Output "VM status for $($VMObject.Name) is $VMStatus. Deallocating VM..."
          Stop-AzVM -Name $VMObject.Name -ResourceGroupName $VMObject.ResourceGroupName -Force
        
        } else {

          Write-Output Write-Output = "PowerState of VM $($VM.VMName) is: $VMStatus. Nothing to do."

        }
        
    }
}
