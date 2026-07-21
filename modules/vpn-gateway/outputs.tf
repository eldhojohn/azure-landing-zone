output "id" {
  description = "Resource ID of the VPN Gateway"
  value       = azurerm_virtual_network_gateway.this.id
}

output "name" {
  description = "Name of the VPN Gateway"
  value       = azurerm_virtual_network_gateway.this.name
}

output "public_ip_address" {
  description = "Public IP address assigned to the VPN Gateway"
  value       = azurerm_public_ip.this.ip_address
}

output "public_ip_id" {
  description = "Resource ID of the VPN Gateway public IP"
  value       = azurerm_public_ip.this.id
}

