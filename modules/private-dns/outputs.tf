output "id" {
  value = azurerm_private_dns_zone.this.id
}

output "name" {
  value = azurerm_private_dns_zone.this.name
}

output "vnet_link_id" {
  description = "Private DNS zone VNet link resource ID"
  value       = azurerm_private_dns_zone_virtual_network_link.this.id
}
