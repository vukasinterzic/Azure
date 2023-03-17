<#
This script is explained in this blog post:
https://azureis.fun/posts/Edit-Azure-Policy-Assignments-with-custom-PowerShell-API/

Author: Vukasin Terzic
#>


function Update-PolicyAssignmentExclusionList {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$PolicyAssignmentName,

        [Parameter(Mandatory = $true)]
        [string]$ResourceGroupName,

        [Parameter(Mandatory = $true)]
        [string]$Action
    )

    # Set the Azure context to the current subscription
    Select-AzSubscription -SubscriptionId (Get-AzContext).Subscription.Id

    # Get the policy assignment by name
    $PolicyScope = "/subscriptions/$((Get-AzContext).Subscription.Id)"
    $PolicyAssignment = Get-AzPolicyAssignment -Scope $PolicyScope | Where-Object { $_.Name -eq $PolicyAssignmentName }

    if (!$PolicyAssignment) {
        Write-Error "Policy assignment '$PolicyAssignmentName' does not exist."
    } else {
        # Get the resource group to modify
        $ResourceGroup = Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue

        if (!$ResourceGroup) {
            Write-Error "Resource group '$ResourceGroupName' does not exist."
        } else {
            # Get the existing exclusion list
            $ExclusionList = $PolicyAssignment.Properties.NotScopes

            # Add or remove the resource group from the exclusion list
            if ($Action -eq "add") {
                $ExclusionList += "/subscriptions/$((Get-AzContext).Subscription.Id)/resourceGroups/$ResourceGroupName"
            } elseif ($Action -eq "remove") {
                $ExclusionList = $ExclusionList | Where-Object { $_ -ne "/subscriptions/$((Get-AzContext).Subscription.Id)/resourceGroups/$ResourceGroupName" }
            }


            # Update the policy assignment with the new exclusion list
            $PolicyAssignment.Properties.NotScopes = $ExclusionList

            # NotScopes does not update if value is not provided. If the exclusion list is empty, set the NotScopes property to an empty array instead
            if ($ExclusionList.Count -eq 0) {
                $PolicyAssignment.Properties.NotScopes = @()
            }
            
            #Update the policy assignment
            $PolicyAssignment | Set-AzPolicyAssignment
        }
    }
}
