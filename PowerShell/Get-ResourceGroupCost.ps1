function Get-ResourceGroupCost {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$ResourceGroupName,
        
        [Parameter(Mandatory = $false)]
        [int]$DaysBack = 30
    )
    
    # Set the time range for the cost data
    $startDate = (Get-Date).AddDays(-$DaysBack)
    $endDate = (Get-Date)

    # Retrieve the cost data for the resource group
    $costs = Get-AzConsumptionUsageDetail -StartDate $startDate -EndDate $endDate -ResourceGroup $ResourceGroupName

    # Display the cost data
    Write-Host "Cost information for resource group '$ResourceGroupName':"

    $TotalCost = @()
    $sum = 0
    $costs | % {$sum += $_.PretaxCost}

    $obj = New-Object -TypeName PSObject
        $obj | Add-Member -MemberType NoteProperty -Name "Start Date" -Value $startDate.ToString("yyyy-MM-dd")
        $obj | Add-Member -MemberType NoteProperty -Name "Resource Group Name" -Value $ResourceGroupName
        $obj | Add-Member -MemberType NoteProperty -Name "Total Cost (pretax)" -Value $sum
        $obj | Add-Member -MemberType NoteProperty -Name "Currency" -Value ($costs.Currency)[0]


    $TotalCost += $obj

    return $TotalCost
}

#Example:
#Get-ResourceGroupCost -ResourceGroupName "RG-AzureIsFun" -DaysBack "30"
