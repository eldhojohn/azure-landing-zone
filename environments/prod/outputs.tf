output "vnet_id" {
  description = "Shared hub virtual network ID"
  value       = module.networking.vnet_id
}

output "management_subnet_id" {
  description = "Shared management subnet ID"
  value       = module.networking.management_subnet_id
}

output "workload_subnet_id" {
  description = "Shared workload subnet ID"
  value       = module.networking.workload_subnet_id
}

output "gateway_subnet_id" {
  description = "Shared Azure GatewaySubnet ID"
  value       = module.networking.gateway_subnet_id
}

output "bastion_subnet_id" {
  description = "Shared Azure Bastion subnet ID"
  value       = module.networking.bastion_subnet_id
}

output "key_vault_id" {
  description = "Shared Key Vault resource ID"
  value       = module.key_vault.id
}

output "key_vault_name" {
  description = "Shared Key Vault name"
  value       = module.key_vault.name
}

output "key_vault_uri" {
  description = "Shared Key Vault URI"
  value       = module.key_vault.vault_uri
}

output "log_analytics_workspace_id" {
  description = "Shared Log Analytics Workspace resource ID"
  value       = module.log_analytics.id
}

output "log_analytics_workspace_name" {
  description = "Shared Log Analytics Workspace name"
  value       = module.log_analytics.name
}

output "log_analytics_customer_id" {
  description = "Log Analytics Workspace customer ID"
  value       = module.log_analytics.workspace_id
}