#Task 2: Replace Tag Name, keep original Tag Value:

# Get all Az Subscriptions
$Subscriptions = Get-AzSubscription

#Define old and new tag names
$WrongName = "WrongTagName"
$CorrectName = "CorrectTagName"

#Subscription loop
foreach ($subscription in $Subscriptions) {

    $Resources = @()

    Write-Host "Selecting Subscription $($Subscription.Name)... "

    Get-AzSubscription -SubscriptionName $Subscription.Name | Set-AZContext

    $Resources = Get-AzResource -TagName $WrongName

    #Resource loop
    foreach ($Resource in $Resources) {

        $ResourceTags = ""
        $WrongTag = ""
        $NewTag = ""
        
        Write-Host "Processing resource $($Resource.Name) ..."
        
        $ResourceTags = Get-AzTag -ResourceId $Resource.ResourceId
        
        $Value = $ResourceTags.Properties.TagsProperty[$WrongName]
        $WrongTag = @{$WrongName=$Value}
        $NewTag = @{$CorrectName=$Value}

        #Create new tag with original value
        Update-AzTag -ResourceId $Resource.ResourceId -Tag $NewTag -Operation Merge
        
        #Delete the old tag with incorrect name
        Update-AzTag -ResourceId $Resource.ResourceId -Tag $WrongTag -Operation Delete
    }

}