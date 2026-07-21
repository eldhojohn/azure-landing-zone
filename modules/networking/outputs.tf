output "management_subnet_id" {
  description = "Management subnet ID"
  value       = azurerm_subnet.management.id
}

output "workload_subnet_id" {
  description = "Workload subnet ID"
  value       = azurerm_subnet.workload.id
}

output "bastion_subnet_id" {
  description = "Resource ID of the Azure Bastion subnet"
  value       = azurerm_subnet.bastion.id
}

output "vnet_id" {
  description = "Hub virtual network ID"
  value       = azurerm_virtual_network.hub.id
}

output "gateway_subnet_id" {
  description = "Resource ID of the Azure GatewaySubnet"
  value       = azurerm_subnet.gateway.id
}