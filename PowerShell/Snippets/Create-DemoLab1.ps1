#Create a RG
#Create a Virtual Network
#Create a Subnet
#Create a Public IP Address
#Create a Load Balancer
#Create a Virtual Machine x2 with the above created RG, Vnet, Subnet, Public IP Address



#Define variables

$Number = Get-Random -Minimum 1 -Maximum 254
$Location = "westus2"
$ResourceGroupName = "RG-Test-DemoLab$Number"
$VirtualNetworkName = "vNet-DemoLab$Number"
$SubnetName = "subnet1-DemoLab$Number"
$PIP1Name = "pip-VM1-DemoLab$Number"
$PIP2Name = "pip-VM2-DemoLab$Number"
$VM1Name = "VM1-DemoLab$Number"
$VM2Name = "VM2-DemoLab$Number"
$VMSize = "Standard_B1ms"
#$VMOS = ""
$VNetAddressPrefix = "10.0.$Number.0/24"
$SubnetAddressPrefix = "10.0.$Number.0/27"
$VMUser = "labuser"
$VMPassword = "Hello$Number$Number!!"

$Tags = @{
    Environment = "Demo"
    Project="BlogPost"
}

#Create a Resource Group
Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Resource Group $ResourceGroupName ..."

$RG = @{
    Name = $ResourceGroupName
    Location = $Location
    Tags = $Tags
}

New-AzResourceGroup @RG


#Create a Virtual Network
Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Virtual Network $VirtualNetworkName with network space $VNetAddressPrefix and subnet $SubnetName ($SubnetAddressPrefix) ..."

$VNET = @{
    Name = $VirtualNetworkName
    Location = $Location
    ResourceGroupName = $ResourceGroupName
    AddressPrefix = @($VNetAddressPrefix)
    
    Subnet = @{
        Name = $SubnetName
        AddressPrefix = $SubnetAddressPrefix
    }
}

New-AzVirtualNetwork @vnet


#Create Public IP Addresses

Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Public IP Address $PIP1Name ..."

$publicIp1 = @{
    Name = $PIP1Name
    ResourceGroupName = $ResourceGroupName
    AllocationMethod = "Dynamic"
    Location = $Location
    Sku = "Basic"
    Tag = @{
        VMName = $VM1Name
    }
}

New-AzPublicIpAddress @publicIp1


Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Public IP Address $PIP2Name ..."

$publicIp2 = @{
    Name = $PIP2Name
    ResourceGroupName = $ResourceGroupName
    AllocationMethod = "Dynamic"
    Location = $Location
    Sku = "Basic"
    Tag = @{
        VMName = $VM2Name
    }
}

New-AzPublicIpAddress @publicIp2




#Create VMs:

Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Virtual Machine $VM1Name ..."



Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Virtual Machine $VM2Name ..."




#List Public IPs:
$PIP1 = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name $PIP1Name
$PIP2 = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name $PIP2Name

Write-Host -ForegroundColor Yellow -BackgroundColor Black "Public IPs: $PIP1, $PIP2"