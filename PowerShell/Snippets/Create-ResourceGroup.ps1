#Create a new Resource Group with PowerShell

$RG = @{
    Name = "MyResourceGroup"
    Location = "mylocation"
    Tags = @{
        "Key1" = "Value"
        "Key2" = "Value"
    }
}

New-AzResourceGroup @RG