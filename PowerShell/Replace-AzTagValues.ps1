#Task 1: Replace Tag Value, keep Tag Name:

# Get all Az Subscriptions
$Subscriptions = Get-AzSubscription

$TagName = 'YourTagName'

$WrongValue = 'wrong tag value'
$CorrectValue = 'new tag value'

$WrongTag = @{$TagName=$WrongValue}
$NewTag = @{$TagName=$CorrectValue}

#subscription loop
foreach ($subscription in $Subscriptions) {

    $Resources = @()

    Write-Host "Selecting Subscription $($Subscription.Name)... "

    Get-AzSubscription -SubscriptionName $Subscription.Name | Set-AZContext

    $Resources = Get-AzResource -Tag $WrongTag

    foreach ($Resource in $Resources) {
            Write-Host "Processing resource $($Resource.Name) ..."
            Update-AzTag -ResourceId $Resource.ResourceId -Tag $NewTag -Operation Merge
    }

}