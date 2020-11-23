provider "azurerm"{
    version = "~>2.36.0"
    features {}
}

variable "location" {
  default = "uksouth"
}

locals {
    storage_name = "mfterramod01"
}

resource "azurerm_resource_group" "rg" {
    name = "terraform-module-rg"
    location = var.location
}

module "matt_storage_account" {
    source = "github.com/fortunkam/terraform-modules/storage/terraform-101-demo"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    storage_account_name = local.storage_name
}



