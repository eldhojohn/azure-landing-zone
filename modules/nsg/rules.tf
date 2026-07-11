resource "azurerm_network_security_rule" "management_rdp_from_admin_ip" {
  name                        = "Allow-RDP-From-Admin-IP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = var.admin_public_ip_cidr
  destination_address_prefix  = "10.0.10.0/24"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.management.name

  description = "Temporarily allow RDP from the administrator public IP"
}

resource "azurerm_network_security_rule" "workload_rdp_from_management" {
  name                        = "Allow-RDP-From-Management"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "10.0.10.0/24"
  destination_address_prefix  = "10.0.20.0/24"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.workload.name

  description = "Allow RDP from the management subnet to workload servers"
}