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

$DiskName = "VM01_disk1"


