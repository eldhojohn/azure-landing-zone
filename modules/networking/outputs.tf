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