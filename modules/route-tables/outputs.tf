output "management_route_table_id" {
  value = azurerm_route_table.management.id
}

output "workload_route_table_id" {
  value = azurerm_route_table.workload.id
}