using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

#Get Az Subscription and Set Context
$SubscriptionName = "Microsoft Azure Sponsorship"
Get-AzSubscription -SubscriptionName $SubscriptionName | Set-AzContext

#Get parameter Resource Group Name
$RGName = $Request.Query.RGName

if (-not $RGName) {
    Write-Host "Name not provided, getting VMs in subscription $SubscriptionName"
    $VMs = Get-AZVM | Select-Object ResourceGroupName, Name
} else {
    Write-Host "Checking if provided Resource Group exist..."
    If (Get-AzResourceGroup -Name $RGName) {
        Write-Host "Resource Group exists."
        $VMs = Get-AZVM -ResourceGroupName $RGName | Select-Object ResourceGroupName, Name
        if (-not $VMs) {
            $VMs = "No VMs found in $RGName"
        }
    } else {
        Write-Host "Resource Group with name $RGName does not exist in subscription $SubscriptionName. Getting all VMs in $SubscriptionName instead"
        $VMs = Get-AZVM  | Select-Object ResourceGroupName, Name
        $VMs = "No VMs found in $SubscriptionName"
    }
}

$body = $VMs 

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
