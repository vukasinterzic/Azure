<#
This script is explained here:
https://azureis.fun/posts/Moving-Managed-Disks-To-Different-Azure-Region/

NOTE: This is not a full script and it should not be run as such. It only contains snippets for individual operations.

## TODO: Make a function.
#>

$SourceSubscriptionName = "Sub1"
$TargetSubscriptionName = "Sub2"

$TargetResourceGroupName = "RG2"

$TargetLocationName = "West US 2"

Connect-AzAccount

$SourceSubscription = Get-AzSubscription -SubscriptionName $SourceSubscriptionName
$TargetSubscription = Get-AzSubscription -SubscriptionName $TargetSubscriptionName

Set-AzContext -SubscriptionObject $SourceSubscription

#Get disk information:
$SourceDisk = Get-AzDisk -DiskName $DiskName

Get Target Location:
$TargetLocation =  (Get-AzLocation | Where-Object { $_.DisplayName -eq $TargetLocationName }).Location

#Validate if target Resource Groups exists and if not create it:
if (-not (Get-AzResourceGroup -Name $TargetResourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $TargetResourceGroupName -Location $TargetLocation -Force | Out-Null
}

If ($SourceSubscription.TenantId -eq $TargetSubscription.TenantId) {

    Move-AzResource -DestinationResourceGroupName $TargetResourceGroupName -DestinationSubscriptionId $TargetSubscription.Id -ResourceId $SourceDisk.Id

}

Set-AzContext -SubscriptionObject $TargetSubscription

#Get disk information from the new subscription:
$SourceDisk = Get-AzDisk -DiskName $DiskName

$storageAccountParams = @{
    ResourceGroupName = $TargetResourceGroupName
    Location          = $TargetLocation
    SkuName           = 'Standard_LRS'
    Name              = 'satemp{0:yyyyMMddHHmmssff}' -f (Get-Date)
}; $targetStorage = New-AzStorageAccount @storageAccountParams


$storageContextParams = @{
    StorageAccountName = $targetStorage.StorageAccountName
    StorageAccountKey  = (
        Get-AzStorageAccountKey -ResourceGroupName $targetStorage.ResourceGroupName -Name $targetStorage.StorageAccountName)[0].Value
}; $storageContext = New-AzStorageContext @storageContextParams

New-AzStorageContainer -Name vhd -Context $storageContext | Out-Null

#Generate SAS token with duration 1 hour and Read access
$osDiskAccessParams = @{
    ResourceGroupName = $TargetResourceGroupName
    DiskName          = $SourceDisk.Name
    DurationInSecond  = 3600
    Access            = 'Read'
}; $osDiskSAS = Grant-AzDiskAccess @osDiskAccessParams

$blobCopyParams = @{
        AbsoluteUri   = $osDiskSAS.AccessSAS
        DestContainer = 'vhd'
        DestContext   = $storageContext
        DestBlob      = ('{0}_Disk.vhd' -f $Disk.Name) #Define your disk name here
}; Start-AzStorageBlobCopy @blobCopyParams | Out-Null

#Because this action is going to take some time, let's monitor the progress:

do {
    Start-Sleep -Seconds 30
    $copyState = Get-AzStorageBlobCopyState -Blob $blobCopyParams.DestBlob -Container 'vhd' -Context $storageContext
    $progress = [Math]::Round((($copyState.BytesCopied / $copyState.TotalBytes) * 100))
    Write-Host ('WAITING: {0:HH:mm:ss} - Waiting for the {1} blob copy process to complete ({2} %)' -f (Get-Date), $DestinationBlob, $progress) -ForegroundColor Yellow
} until ($copyState.Status -ne [Microsoft.Azure.Storage.Blob.CopyStatus]::Pending)

$disksDetails = @{ }
$disksDetails.Add(($SourceDisk.Name),
    [PSCustomObject]@{
        SkuName = $SourceDisk.Sku.Name
        Caching = "ReadWrite"
    }
)

$newDiskConfigParams = @{
    CreateOption     = 'Import'
    StorageAccountId = $targetStorage.Id
    SkuName          = ($disksDetails[($SourceDisk.Name)]).SkuName
    OsType           = "Windows"
    Location         = $TargetLocation
    SourceUri        = 'https://{0}.blob.core.windows.net/vhd/{1}_Disk.vhd' -f $targetStorage.StorageAccountName, $SourceDisk.Name
}; $newDiskConfig = New-AzDiskConfig @newDiskConfigParams

$newDiskParams = @{
    Disk              = $newDiskConfig
    ResourceGroupName = $TargetResourceGroupName
    DiskName          = 'NewDisk_{0}' -f $SourceDisk.Name
}; $newOsDisk = New-AzDisk @newDiskParams
