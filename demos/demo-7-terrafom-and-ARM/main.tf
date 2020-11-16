provider "azurerm"{
    version = "~>2.36.0"
    features {}
}
resource "azurerm_resource_group" "rg" {
    name = "terraform-arm-rg"
    location = "uksouth"
}

resource "azurerm_resource_group_template_deployment" "example" {
    name                = "arm-deploy"
    resource_group_name = azurerm_resource_group.rg.name
    deployment_mode     = "Complete"
    template_content    = file("template-good.json")
    parameters_content =  jsonencode({
        storage-account-name = {value = "tfdemoarm01"}
    })
}