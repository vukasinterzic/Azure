<#
This script creates an Azure Virtual Machine, installs the Log Analytics agent, and enrolls the system with a Log Analytics workspace. 
Once the script has run, the virtual machine will be visible in Azure Monitor.
#>


# OMS ID and OMS key
$omsId = "<Replace with your OMS ID>"
$omsKey = "<Replace with your OMS key>"

# Variables for common values
$resourceGroup = "myResourceGroup"
$location = "westeurope"
$vmName = "myVM"

# Create a user object
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

# Create a resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create a virtual machine
New-AzVM `
  -ResourceGroupName $resourceGroup `
  -Name $vmName `
  -Location $location `
  -ImageName "Win2016Datacenter" `
  -VirtualNetworkName "myVnet" `
  -SubnetName "mySubnet" `
  -SecurityGroupName "myNetworkSecurityGroup" `
  -PublicIpAddressName "myPublicIp" `
  -Credential $cred `
  -OpenPorts 3389

# Install and configure the OMS agent
$PublicSettings = New-Object psobject | Add-Member -PassThru NoteProperty workspaceId $omsId | ConvertTo-Json
$protectedSettings = New-Object psobject | Add-Member -PassThru NoteProperty workspaceKey $omsKey | ConvertTo-Json

Set-AzVMExtension -ExtensionName "OMS" -ResourceGroupName $resourceGroup -VMName $vmName `
  -Publisher "Microsoft.EnterpriseCloud.Monitoring" -ExtensionType "MicrosoftMonitoringAgent" `
  -TypeHandlerVersion 1.0 -SettingString $PublicSettings -ProtectedSettingString $protectedSettings `
  -Location $location