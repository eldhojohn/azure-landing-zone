resource "azurerm_resource_group" "network" {
  name     = "rg-network-prod-aue-001"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "security" {
  name     = "rg-security-prod-aue-001"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "monitoring" {
  name     = "rg-monitor-prod-aue-001"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "compute" {
  name     = "rg-compute-prod-aue-001"
  location = var.location
  tags     = var.tags
}