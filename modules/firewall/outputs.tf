output "id" {
  description = "Resource ID of the Azure Firewall."
  value       = azurerm_firewall.this.id
}

output "name" {
  description = "Name of the Azure Firewall."
  value       = azurerm_firewall.this.name
}

output "private_ip_address" {
  description = "Private IP address of the Azure Firewall."
  value       = azurerm_firewall.this.ip_configuration[0].private_ip_address
}

output "public_ip_address" {
  description = "Public IP address assigned to the Azure Firewall."
  value       = azurerm_public_ip.this.ip_address
}

output "public_ip_id" {
  description = "Resource ID of the Azure Firewall public IP."
  value       = azurerm_public_ip.this.id
}

output "policy_id" {
  description = "Resource ID of the Azure Firewall Policy."
  value       = azurerm_firewall_policy.this.id
}
