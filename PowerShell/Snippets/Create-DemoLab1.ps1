#Create a RG
#Create a Virtual Network
#Create a Subnet
#Create a Public IP Address
#Create a Load Balancer
#Create a Virtual Machine x2 with the above created RG, Vnet, Subnet, Public IP Address



#Define variables

$Number = Get-Random -Minimum 1 -Maximum 254
$Location = "westus2"
$ResourceGroupName = "RG-DemoLab$Number"
$VirtualNetworkName = "vNet-DemoLab$Number"
$SubnetName = "subnet1-DemoLab$Number"
$PIP1Name = "pip-VM1-DemoLab$Number"
$PIP2Name = "pip-VM2-DemoLab$Number"
$VM1Name = "VM1-DemoLab$Number"
$VM2Name = "VM2-DemoLab$Number"
$VMSize = "Standard_B1ms"
$VMOS = ""
$VNetAddressPrefix = "10.0.$Number.0/24"
$SubnetAddressPrefix = "10.0.$Number.0/27"

$Tags = $VM.Tags
$Tags += @{"Environment"="Demo"}

#Create a Resource Group
Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Resource Group $ResourceGroupName ..."

New-AzResourceGroup -Name $ResourceGroupName -Location $Location -Tag $Tags



#Create a Virtual Network
Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Virtual Network $VirtualNetworkName ..."

New-AzVNet -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName -Location $Location -Tag $Tags


#Create a Subnet
Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Subnet $SubnetName ..."


#Create Public IP Addresses

Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Public IP Address $PIP1Name ..."


Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Public IP Address $PIP2Name ..."


#Create VMs:

Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Virtual Machine $VM1Name ..."


Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Virtual Machine $VM2Name ..."




#List Public IPs:
$PIP1 = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name $PIP1Name
$PIP2 = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name $PIP2Name

Write-Host -ForegroundColor Yellow -BackgroundColor Black "Public IPs: $PIP1, $PIP2"