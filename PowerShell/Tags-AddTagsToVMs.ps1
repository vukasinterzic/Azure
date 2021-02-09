$VM = Get-AzResource -ResourceType "Microsoft.Compute/VirtualMachines" -Name "VMName"

$Tags = $VM.Tags
$Tags += @{"Operational-Schedule"="Yes"}
$Tags += @{"Operational-Weekdays"="7-18"}
$Tags += @{"Operational-Weekends"="7-13"}
$Tags += @{"Operational-UTCOffset"="-8"}
$Tags += @{"Operational-Exclusions"="Weekends"}

$VM | Set-AzResource -Tag $Tags -Force