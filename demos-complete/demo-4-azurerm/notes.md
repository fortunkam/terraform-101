Talk about authentication - Az Login, SP, use_msi etc.

Create simple resource group + storage account
Create resource group first and deploy
Create storage account - talk about dependency on rg (implied depends on)
Refactor - move location to variable
Talk about passing varaibles in `apply -var="location=uksouth"`, -var-file="test.tfvars", default terraform.tfvars
Refactor - move storage to new file


    provider "azurerm"{
        version = "~>2.36.0"
        features {}
    }

    variable "location" {
    default = "uksouth"
    description = "The location for all resources"
    }

    resource "azurerm_resource_group" "rg" {
        name = "terraform-demo-rg"
        location = var.location
    }

    resource "azurerm_storage_account" "storage" {
        name = "mfterrademo01"
        resource_group_name = azurerm_resource_group.rg.name
        location = var.location
        account_tier = "Standard"
        account_replication_type = "GRS"
    }

Move storagename to local variable
Add tags as local variable (complex types)
Use built in merge function to extend default tags

    provider "azurerm"{
        version = "~>2.36.0"
        features {}
    }


    variable "location" {
    default = "uksouth"
    description = "The location for all resources"
    }

    locals {
        storage_name = "mfterrademo01"
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

Show use of count to deploy multiples
Also highlight string interpolation

    resource "azurerm_resource_group" "rgcopy" {
        count = 3
        name = "terraform-copy${count.index}"
        location = var.location
        tags = local.default_tags
    }



