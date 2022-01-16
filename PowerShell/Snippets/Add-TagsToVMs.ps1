
$VMNames = @("VMName1", "VMName2")

foreach ($VMName in $VMNames) {

    Write-Output "Processing $VMName ..."

    $VM = Get-AzResource -ResourceType "Microsoft.Compute/VirtualMachines" -Name $VMName

    $Tags = $VM.Tags
    $Tags += @{"Key1"="Value"}
    $Tags += @{"Key2"="Value"}
    
    $VM | Set-AzResource -Tag $Tags -Force

}