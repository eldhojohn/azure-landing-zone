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

resource "azurerm_route" "workload_default_to_firewall" {
  name                = "route-default-to-azure-firewall"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.workload.name

  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = var.firewall_private_ip
}