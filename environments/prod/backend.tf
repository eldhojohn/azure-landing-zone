terraform {
  backend "azurerm" {
    resource_group_name  = "rg-azure-foundation"
    storage_account_name = "cap10tfstate001"
    container_name       = "tfstate"
    key                  = "prod/terraform.tfstate"
  }
}