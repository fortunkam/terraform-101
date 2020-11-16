# az login

# Step 1 - Create a resource group
az group create --name clidemo --location uksouth

# Step 2 - Create a storage account with a random name
$chars = [char[]]"abcdefghijklmnopqrstuvwxyz0123456789"
$storageAccountName = [string](($chars[0..25]|Get-Random)+(($chars|Get-Random -Count 14) -join ""))

az storage account create -n $storageAccountName -g clidemo

# Step 3 - Create a blob container
az storage container create --account-name $storageAccountName --name mycontainer

# Step 4 - Upload a file to a blob container
New-Item -Path 'Test.txt' -ItemType File
az storage blob upload --container-name mycontainer --account-name $storageAccountName -n test_txt --file 'Test.txt'


