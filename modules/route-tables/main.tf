resource "azurerm_route_table" "management" {
  name                = "rt-management-prod-aue-001"
  location            = var.location
  resource_group_name = var.resource_group_name

  bgp_route_propagation_enabled = true

  tags = var.tags
}

resource "azurerm_route_table" "workload" {
  name                = "rt-workload-prod-aue-001"
  location            = var.location
  resource_group_name = var.resource_group_name

  bgp_route_propagation_enabled = true

  tags = var.tags
}