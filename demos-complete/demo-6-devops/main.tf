provider "azurerm"{
    version = "~>2.36.0"
    features {}
}
resource "azurerm_resource_group" "rg" {
    name = "terraform-devops-rg"
    location = "uksouth"
}

terraform {
    backend "azurerm" {
        resource_group_name     = "github-backend"
        storage_account_name    = "tfstorehytmnroqwm"
        container_name          = "terraform-mafortun-dev"
        key                     = "tf101demo.tfstate"
    }
}