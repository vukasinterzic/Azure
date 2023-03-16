<#
This script will collect all policy assignments in available subscriptions and list them as a table.
#>

# Log in to your Azure account
#Connect-AzAccount

function Get-ScopeName($scopeId) {
    if ($scopeId -match "/providers/Microsoft.Management/managementGroups/") {
        $mgId = $scopeId -replace "/providers/Microsoft.Management/managementGroups/", ""
        $mg = Get-AzManagementGroup -GroupName $mgId
        return $mg.DisplayName
    } elseif ($scopeId -match "/subscriptions/") {
        $subId = $scopeId -replace "/subscriptions/", ""
        $sub = Get-AzSubscription -SubscriptionId $subId
        return $sub.Name
    } elseif ($scopeId -match "/resourceGroups/") {
        $subId = $scopeId -replace "/resourceGroups/.*", ""
        $rgName = $scopeId -replace ".*/resourceGroups/", ""
        $rg = Get-AzResourceGroup -Name $rgName -Scope "/subscriptions/$subId"
        return $rg.ResourceGroupName
    } else {
        return "Unknown"
    }
}

# Get all subscriptions
$subscriptions = Get-AzSubscription

# Initialize an empty array to store policy assignments and their scopes
$policyAssignmentsWithScopes = @()



# Loop through each subscription
foreach ($subscription in $subscriptions) {
    # Select the current subscription
    Set-AzContext -SubscriptionId $subscription.Id

    # Get all policy assignments for the current subscription
    $policyAssignments = Get-AzPolicyAssignment

    # Loop through each policy assignment
    foreach ($policyAssignment in $policyAssignments) {
        
        
        # Get the scope name
        $scopeName = Get-ScopeName -scopeId $policyAssignment.Properties.Scope

        
        # Add policy assignment name and scope to the array
        $policyAssignmentsWithScopes += [PSCustomObject]@{
            PolicyAssignmentName = $policyAssignment.Name
            ScopeName = $scopeName
            PolicyName = $policyAssignment.Properties.DisplayName
            PolicyDescription = $policyAssignment.Properties.Description
            Enforced = $policyAssignment.Properties.EnforcementMode
        }
    }
}

# Display policy assignments and their scopes
$policyAssignmentsWithScopes | Format-Table -AutoSize
