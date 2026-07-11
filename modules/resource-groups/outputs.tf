output "network_rg_name" {
  value = azurerm_resource_group.network.name
}

output "security_rg_name" {
  value = azurerm_resource_group.security.name
}

output "monitoring_rg_name" {
  value = azurerm_resource_group.monitoring.name
}

output "compute_rg_name" {
  value = azurerm_resource_group.compute.name
}