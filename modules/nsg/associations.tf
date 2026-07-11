resource "azurerm_subnet_network_security_group_association" "management" {
  subnet_id                 = var.management_subnet_id
  network_security_group_id = azurerm_network_security_group.management.id
}

resource "azurerm_subnet_network_security_group_association" "workload" {
  subnet_id                 = var.workload_subnet_id
  network_security_group_id = azurerm_network_security_group.workload.id
}