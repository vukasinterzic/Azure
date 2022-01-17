#Create new KeyVault with PowerShell

$KeyVault = @{
    Name = "myKeyVaultName"
    ResourceGroupName = "myResourceGroupName"
    Location = "myLocation"
    EnabledForDeployment = $false
    EnabledForTemplateDeployment = $false
    EnabledForDiskEncryption = $false
    tags = @{
        tag1 = "value1"
        tag2 = "value2"
    }
}

New-AzKeyVault @KeyVault