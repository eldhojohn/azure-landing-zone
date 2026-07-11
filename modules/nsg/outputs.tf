output "management_nsg_id" {
  value = azurerm_network_security_group.management.id
}

output "workload_nsg_id" {
  value = azurerm_network_security_group.workload.id
}