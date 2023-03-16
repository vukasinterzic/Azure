#To simplify this example, we can define hashtable with naming standard:
$ResourceNamesHash = @{}
$ResourceNamesHash.Add("Microsoft.Compute/virtualMachines", "VM-`$Subscription-`$Description")
$ResourceNamesHash.Add("Microsoft.KeyVault/vault", "kv-`$Environment-`$Description")
$ResourceNamesHash.Add("Microsoft.Network/vpnGateways", "vpng-`$VNetName-`$Description")

# Define a function to get the abbreviation for a given resource type
function Get-ResourceNamingConvention {
    param(
        [Parameter(Mandatory=$true)]
        [string]$ResourceType
    )

    if ($ResourceNamesHash.ContainsKey($ResourceType)) {
        
        Write-Host "Naming Policy for $ResourceType is:" $ResourceNamesHash[$ResourceType]

    } else { 
        throw "Unknown resource type: $ResourceType"
    }
}

#Example:
#Get-ResourceNamingConvention -ResourceType "Microsoft.Network/vpnGateways"
