provider "azurerm"{
    version = "~>2.36.0"
    features {}
}


variable "location" {
  default = "uksouth"
  description = "The location for all resources"
}

locals {
    storage_name = "mfterrademo"
    default_tags = {
        mytag = "awesome"
    }
}

resource "azurerm_resource_group" "rg" {
    name = "terraform-demo-rg"
    location = var.location
    tags = local.default_tags
}

resource "azurerm_storage_account" "storage" {
    name = local.storage_name
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "GRS"
    tags = merge(local.default_tags, 
    {
        storage="store1"
    })
}

resource "azurerm_resource_group" "rgcopy" {
    count = 3
    name = "terraform-copy${count.index}"
    location = var.location
    tags = local.default_tags
}


