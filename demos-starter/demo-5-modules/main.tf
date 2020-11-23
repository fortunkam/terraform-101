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


