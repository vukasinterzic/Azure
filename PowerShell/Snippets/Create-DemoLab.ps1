#Create a RG
#Create KeyVault and Secret with VM login credentials
#Create an Automation Account and give it access to the KeyVault
#Create a Virtual Network
#Create a Subnet
#Create a Public IP Address
#Create a Virtual Machines with the above created RG, Vnet, Subnet, Public IP Address, open port 3389
#Create a System Assigned Managed Identity for VM1 and allow access to KeyVault


#TODO: Move Management Identity creation and assignment to the bottom of the script. Policy for Automation and VM should be created together.
#TODO: Add load balancer
#TODO: Add a web app, open port 80 and 443, install IIS
#FIXME: Add verifications and checks everywhere
#FIXME: Add option to create a new RG or use an existing one
#FIXME: Add option to enable logging
#TODO: Create 2 functions: Create-DemoLab, Remove-DemoLab
#TODO: Add timestamp

#Define variables

$Version = "0.4"
$Number = Get-Random -Minimum 1 -Maximum 254
$Location = "westus2"
$SubscriptionName = "Microsoft Azure Sponsorship"
$ResourceGroupName = "RG-Test-DemoLab$Number"
$KeyVaultName = "KeyVault-DemoLab$Number"
$AutomationAccountName = "AutomationAccount-DemoLab$Number"
$VirtualNetworkName = "vNet-DemoLab$Number"
$SubnetName = "subnet1-DemoLab$Number"
$NumberOfSrv2016VMs = 1
$NumberOfSrv2019VMs = 1
$NumberOfUbuntuVMs = 0
$NumberOfWin10VMs = 0
$NumberOfVMs = $NumberOfSrv2016VMs + $NumberOfSrv2019VMs + $NumberOfUbuntuVMs + $NumberOfWin10VMs
$VMSize = "Standard_B2ms"
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

Write-Host -ForegroundColor Green "Script version $Version"

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

    $PublicIPinfo = @{
        Name = "pip-VM$i-DemoLab$Number"
        ResourceGroupName = $ResourceGroupName
        AllocationMethod = "Dynamic"
        Location = $Location
        Sku = "Basic"
        Tag = @{
            VMNumber = "VM$i"
        }
    }

    New-AzPublicIpAddress @PublicIPinfo

    #Create a VM
    
    Write-Host -ForegroundColor Black -BackgroundColor Cyan "Creating VM $i ..."
    
    if ($NumberOfSrv2016VMs -gt 0) {
        
        Write-Host -ForegroundColor Black -BackgroundColor Cyan "VM Image is Windows Server 2016 Datacenter"
        $ImageName = "Win2016Datacenter"
        $OSName = "WS2016"
        $NumberOfSrv2016VMs = $NumberOfSrv2016VMs - 1
    
    } elseif ($NumberOfSrv2019VMs -gt 0) {
    
        Write-Host -ForegroundColor Black -BackgroundColor Cyan "VM Image is Windows Server 2019 Datacenter"
        $ImageName = "Win2019Datacenter"
        $OSName = "WS2019"
        $NumberOfSrv2019VMs = $NumberOfSrv2019VMs - 1
    
    } elseif ($NumberOfUbuntuVMs -gt 0) {

        Write-Host -ForegroundColor Black -BackgroundColor Cyan "VM Image is Ubuntu LTS"
        $ImageName = "UbuntuLTS"
        $OSname = "Ubuntu"
        $NumberOfUbuntuVMs = $NumberOfUbuntuVMs - 1

    } elseif ($NumberOfWin10VMs -gt 0) {

        Write-Host -ForegroundColor Black -BackgroundColor Cyan "VM Image is Windows 10"
        $ImageName = "MicrosoftWindowsDesktop:Windows-10:win10-21h2-ent:latest"
        $OSName = "Win10"
        $NumberOfWin10VMs = $NumberOfWin10VMs - 1

    }


    $VMInfo = @{
        ResourceGroupName = $ResourceGroupName
        Location = $Location
        Name = "VM$i-$OSName-$Number"
        VirtualNetworkName = $VirtualNetworkName
        SubnetName = $SubnetName
        PublicIpAddressName = "pip-VM$i-DemoLab$Number"
        Image = $ImageName
        Size = $VMSize
        OpenPorts = "3389"
        Credential = New-Object System.Management.Automation.PSCredential ($VMUser, $VMPassword);
    }
    
    New-AzVM @VMinfo -AsJob



    #Increase the counter
    $i++

} #the end of the loop

Write-Host -ForegroundColor Black -BackgroundColor Yellow "Collecting information about the VMs ..."

$VMs = Get-AZVM -ResourceGroupName $ResourceGroupName

while ($($VMs.Count) -lt $NumberOfVMs) {
    Write-Host -ForegroundColor Black -BackgroundColor Yellow "Waiting for the VMs to be created ..."
    $VMs = Get-AZVM -ResourceGroupName $ResourceGroupName
    Start-Sleep -Seconds 10
}


foreach ($VM in $VMs) {

    $VMID = $($VM.Name).Split("-")[0]
    $PublicIPName = "pip-$VMID-DemoLab$Number"
    $PublicIP = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name $PublicIPName

    while ($($PublicIP.IpAddress) -eq "Not Assigned") {
        
        Write-Host -ForegroundColor Black -BackgroundColor Yellow "Waiting for Public IP Address to be assigned ..."
        
        Start-Sleep -Seconds 5
        $PublicIP = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name $PublicIPName
    }
    
    Write-Host -ForegroundColor Black -BackgroundColor White -NoNewline "Public IP for $($VM.Name) is "
    Write-Host -ForegroundColor Black -BackgroundColor Cyan "$($PublicIP.IpAddress)"

}

Write-Host -ForegroundColor Black -BackgroundColor Cyan  "Creating System Assigned Managed Identity for the first VM on the list ..."
$VM = $VMs[0]

Update-AzVM -ResourceGroupName $ResourceGroupName -VM $VM -IdentityType SystemAssigned

Write-Host -ForegroundColor Black -BackgroundColor Cyan  "Assigning VM access to KeyVault ..."

$VMSysIdentity = (Get-AzVM -Name $VM.Name -ResourceGroupName $ResourceGroupName).identity.principalid

Set-AzKeyVaultAccessPolicy -VaultName $KeyVaultName -ObjectId $VMSysIdentity -PermissionsToSecrets list,get

(Get-AzKeyVault -Name $KeyVaultName -ResourceGroupName $ResourceGroupName).AccessPolicies | where-object {$_.ObjectId -eq $VMSysIdentity}


# Getting the VM password secret from KeyVault
Write-Host -ForegroundColor Black -BackgroundColor White -NoNewline "VM admin user name for all VMs is "
Write-Host -ForegroundColor Black -BackgroundColor Magenta -NoNewline "$VMUser"
Write-Host -ForegroundColor Black -BackgroundColor White -NoNewline " and the password from KeyVault is: "
Write-Host -ForegroundColor Black -BackgroundColor Magenta "$(Get-AzKeyVaultSecret -VaultName $KeyVaultName -Name $VMUser -AsPlainText)"





<# 

#Removing deleted KeyVaults:

Get-AzKeyVault -InRemovedState | % { Remove-AzKeyVault -VaultName $_.VaultName -InRemovedState -Force -Location $Location }


#>