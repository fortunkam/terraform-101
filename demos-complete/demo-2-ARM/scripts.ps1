# az login

# Step 1 - Create a resource group
az group create --name clidemo --location uksouth

# Step 2 - deploy the template
az deployment group create -g clidemo --template-file 'template-bad.json'



