Show built in actions for GitHub Actions and AzDevOps Pipelines


Talk about local state files
Problem with build agents
backend state 

    terraform {
        backend "azurerm" {
            resource_group_name     = "github-backend"
            storage_account_name    = "tfstorehytmnroqwm"
            container_name          = "terraform-mafortun-dev"
            key                     = "tf101demo.tfstate"
        }
    }

need to init after adding backend
Show tfstate created in storage
describe problem about creating a storage account first?
