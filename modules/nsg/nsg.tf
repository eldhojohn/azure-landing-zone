resource "azurerm_network_security_group" "management" {
  name                = "nsg-management-prod-aue-001"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "workload" {
  name                = "nsg-workload-prod-aue-001"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}