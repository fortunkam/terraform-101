Downside of terraform is the lag between new features being added and the provider being updated.
Fallback to ARM

Up until recently use azurerm_template_deployment, this did not delete resources on destroy.
Use new azurerm_resource_group_template_deployment which does. (released in 2.30.0 October 1st)

Show inline version 

    resource "azurerm_resource_group_template_deployment" "example" {
        name                = "arm-deploy"
        resource_group_name = azurerm_resource_group.rg.name
        deployment_mode     = "Complete"
        template_content    = <<TEMPLATE
        {
            "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
                "storage-account-name": {
                    "type": "string"
                }
            },
            "resources": [
                {
                    "name": "[parameters('storage-account-name')]",
                    "type": "Microsoft.Storage/storageAccounts",
                    "apiVersion": "2019-06-01",
                    "location": "[resourceGroup().location]",
                    "kind": "StorageV2",
                    "sku": {
                        "name": "Premium_LRS",
                        "tier": "Premium"
                    }
                }
            ]
        }
        TEMPLATE
        parameters_content =  jsonencode({
            storage-account-name = {value = "tfdemoarm01"}
        })
    }`



and reference file

    resource "azurerm_resource_group_template_deployment" "example" {
        name                = "arm-deploy"
        resource_group_name = azurerm_resource_group.rg.name
        deployment_mode     = "Complete"
        template_content    = file("template-good.json")
        parameters_content =  jsonencode({
            storage-account-name = {value = "tfdemoarm01"}
        })
    }

