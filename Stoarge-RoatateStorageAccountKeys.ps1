# this script will show how to rotate one of the access keys for a storage account

# get list of locations and pick one
Get-AzLocation | Select-Object Location

# save the location you want to use  
$location = "eastus"

# create a resource group
$resourceGroup = "myResourceGroup"
New-AzResourceGroup -Name $resourceGroup -Location $location 

# create a standard general-purpose storage account 
$storageAccountName = "myStorageAccount"
New-AzStorageAccount -ResourceGroupName $resourceGroup `
  -Name $storageAccountName `
  -Location $location `
  -SkuName Standard_LRS `

# retrieve the first storage account key and display it 
$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroup -Name $storageAccountName).Value[0]

Write-Host -Message "storage account key 1 = " $storageAccountKey

# re-generate the key
New-AzStorageAccountKey -ResourceGroupName $resourceGroup `
    -Name $storageAccountName `
    -KeyName key1

# retrieve it again and display it 
$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroup -Name $storageAccountName).Value[0]
Write-Host -Message "storage account key 1 = " $storageAccountKey