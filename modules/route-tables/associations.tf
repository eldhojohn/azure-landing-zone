resource "azurerm_subnet_route_table_association" "management" {
  subnet_id      = var.management_subnet_id
  route_table_id = azurerm_route_table.management.id
}

resource "azurerm_subnet_route_table_association" "workload" {
  subnet_id      = var.workload_subnet_id
  route_table_id = azurerm_route_table.workload.id
}