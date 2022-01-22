#Create a RG
#Create KeyVault and Secret with VM login credentials
#Create an Automation Account
#Create a Virtual Network
#Create a Subnet
#Create a Public IP Address
#Create a Virtual Machine x2 with the above created RG, Vnet, Subnet, Public IP Address, open port 3389


#TODO: Add load balancer
#TODO: Add a web app, open port 80 and 443, install IIS
#FIXME: Add verifications and checks
#TODO: Add variable number of VMs (that will affect number of VMs, Public IPs, and verify if the size of VNet/Subnet is enough)


#Define variables

$Number = Get-Random -Minimum 1 -Maximum 254
$Location = "westus2"
$SubscriptionName = "Microsoft Azure Sponsorship"
$ResourceGroupName = "RG-Test-DemoLab$Number"
$KeyVaultName = "KeyVault-DemoLab$Number"
$AutomationAccountName = "AutomationAccount-DemoLab$Number"
$VirtualNetworkName = "vNet-DemoLab$Number"
$SubnetName = "subnet1-DemoLab$Number"
$NumberOfVMs = 300
$VMSize = "Standard_B1ms"
$VNetAddressPrefix = "10.0.$Number.0/24"
$SubnetAddressPrefix = "10.0.$Number.0/27"
$VMUser = "labuser"
$VMPassword = ConvertTo-SecureString "Hello$(Get-Random -Minimum 10000)!" -AsPlainText -Force


$Tags = @{
    Environment = "Demo"
    Project="BlogPost"
}

#Checking login status
if (-not (Get-AzContext)) {
    Write-Host -ForegroundColor Magenta "Please login to an Azure account"
    Connect-AzAccount
}

#Check if subscription is correct
if ((Get-AzContext).Subscription.Name -ne $SubscriptionName) {
    Write-Host -ForegroundColor Red "Switching to the correct subscription"
    
    Get-AzSubscription -SubscriptionName $SubscriptionName | Set-AzContext

}

#FIXME: If subscription selection not success, throw error



Write-Host -BackgroundColor Magenta -ForegroundColor White "Checking if subnet mask is valid and if requested number of VMs will fit in the subnet..."


#Check Number of VMs
if ($NumberOfVMs -notin (1..249)) {
    Write-Host -ForegroundColor Red "Number of VMs must be between 1 and 249. Please try again."
    exit 1
}

#Get subnet mask from Subnet definition
$SubnetMask = $SubnetAddressPrefix.Split("/")[1]

#Class C definition
$SubnetSizes = @{
    "24" = "254"
    "25" = "126"
    "26" = "62"
    "27" = "30"
    "28" = "14"
    "29" = "6"
}

#Check if subnet mask is valid
If ($SubnetMask -notin $SubnetSizes.Keys) {
    Write-Host -ForegroundColor Red "Subnet mask is not valid! Please choose a Class C subnet mask 24-29 and retry."
    exit 1
}

#Check if requested number of VMs will fit in the subnet
#- 5 addresses for Azure Reserved IPs
if (($SubnetSizes[$SubnetMask] - 5) -lt $NumberOfVMs) {
    Write-Host -ForegroundColor Red "The subnet is not big enough to create the number of VMs requested! Please choose a bigger subnet or smaller number of VMs and retry."
    exit
}

#Create a Resource Group
Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Resource Group $ResourceGroupName ..."

$RG = @{
    Name = $ResourceGroupName
    Location = $Location
    Tags = $Tags
}

New-AzResourceGroup @RG

#Create a Key Vault
Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Key Vault $KeyVaultName ..."

$KeyVault = @{
    Name = $KeyVaultName
    ResourceGroupName = $ResourceGroupName
    Location = $Location
    EnabledForDeployment = $true
    EnabledForTemplateDeployment = $true
    EnabledForDiskEncryption = $true
}

New-AzKeyVault @KeyVault

#Create KeyVault Secret
Write-Host -ForegroundColor Black -BackgroundColor Cyan "Saving VM local admin User Name and Password as a KeyVault secret ..."

Set-AzKeyVaultSecret -VaultName $KeyVaultName -Name $VMUser -SecretValue $VMPassword


#Create an Automation Account with System Assigned Identity
Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Automation Account $AutomationAccountName ..."

$automationAccount = @{
    Name = $AutomationAccountName
    ResourceGroupName = $ResourceGroupName
    Location = $Location
    Tags = $Tags
}

New-AzAutomationAccount @automationAccount -AssignSystemIdentity


#Assign Automation Account access to the KeyVault
Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating KeyVault Access Policy for Automation Account ..."

$KeyVaultAccessPolicy = @{

    PermissionsToKeys = "All"
    PermissionsToSecrets = "All"
    PermissionsToCertificates = "All"
    PermissionsToStorage = "All"
    VaultName = $KeyVaultName
    ServicePrincipalName = (Get-AzADServicePrincipal -DisplayName $AutomationAccountName).AppId
    ResourceGroupName = $ResourceGroupName
}

Set-AzKeyVaultAccessPolicy @KeyVaultAccessPolicy


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




#Loop to create VMs and Public IPs
Write-Host -ForegroundColor Black -BackgroundColor Yellow "Creating $NumberOfVMs VMs and Public IPs ..."

foreach($i in 1..$NumberOfVMs){


    #Create Public IP Addresses

    Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating Public IP Address $i ..."

    $publicIP = @{
        Name = "pip-VM$i-DemoLab$Number"
        ResourceGroupName = $ResourceGroupName
        AllocationMethod = "Dynamic"
        Location = $Location
        Sku = "Basic"
        Tag = @{
            VMName = "VM$i-DemoLab$Number"
        }
    }

    New-AzPublicIpAddress @publicIP



    #Create a VM
    
    Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating VM $i ..."
    
    $VM = @{
        ResourceGroupName = $ResourceGroupName
        Location = $Location
        Name = "VM$i-DemoLab$Number"
        VirtualNetworkName = $VirtualNetworkName
        SubnetName = $SubnetName
        PublicIpAddressName = "pip-VM$i-DemoLab$Number"
        Size = $VMSize
        OpenPorts = "3389"
        Credential = New-Object System.Management.Automation.PSCredential ($VMUser, $VMPassword);
    }
    
    New-AzVM @VM -AsJob



    #Increase the counter
    $i++

}

#List Public IPs:
Write-Host -ForegroundColor Yellow "Waiting for Public IPs to be assigned..."

$PIP1 = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name $PIP1Name
$PIP2 = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name $PIP2Name

while (($($PIP1.IpAddress) -eq "Not Assigned") -or ($($PIP2.IpAddress) -eq "Not Assigned")) {

    Write-Host -ForegroundColor Yellow "Public IP Addresses are not assigned yet..."

    Start-Sleep -Seconds 5
    $PIP1 = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name $PIP1Name
    $PIP2 = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name $PIP2Name
}

Write-Host -ForegroundColor Black -BackgroundColor Yellow -NoNewline "Public IP for $VM1Name is "
Write-Host -ForegroundColor Black -BackgroundColor Cyan -NoNewline "$($PIP1.IpAddress)"
Write-Host -ForegroundColor Black -BackgroundColor Yellow -NoNewline ", and for $VM2Name is "
Write-Host -ForegroundColor Black -BackgroundColor Cyan "$($PIP2.IpAddress)"

Write-Host -ForegroundColor Black -BackgroundColor Yellow -NoNewline "VM admin user name is "
Write-Host -ForegroundColor Black -BackgroundColor Cyan -NoNewline "$VMUser"
Write-Host -ForegroundColor Black -BackgroundColor Yellow -NoNewline " and the password from KeyVault is: "
Write-Host -ForegroundColor Black -BackgroundColor Cyan "$(Get-AzKeyVaultSecret -VaultName $KeyVaultName -Name $VMUser -AsPlainText)"