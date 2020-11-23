# Uses the new TemplateSpec preview feature

# Step 1 - Create a resource group
az group create --name clidemo --location uksouth

# Step 2 - Create the template spec
az ts create --n storageSpec --version "1.0.0.0" -g clidemo --template-file "template-linked.json"

# Step 3 - Deploy the template spec
$id = (az template-specs show -g clidemo -n storageSpec --version "1.0.0.0" --query "id" -o tsv)

az deployment group create -g clidemo --template-spec $id


