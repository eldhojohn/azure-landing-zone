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

output "firewall_subnet_id" {
  description = "Azure Firewall subnet ID"
  value       = azurerm_subnet.firewall.id
}

output "appservice_integration_subnet_id" {
  value = azurerm_subnet.appservice_integration.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoints.id
}

output "application_gateway_subnet_id" {
  value = azurerm_subnet.application_gateway.id
}