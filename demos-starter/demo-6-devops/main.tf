provider "azurerm"{
    version = "~>2.36.0"
    features {}
}
resource "azurerm_resource_group" "rg" {
    name = "terraform-devops-rg"
    location = "uksouth"
}
