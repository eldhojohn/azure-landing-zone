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

output "compute_resource_group_name" {
  description = "Name of the shared compute resource group"
  value       = module.resource_groups.compute_rg_name
}


output "storage_private_dns_zone_id" {
  description = "Resource ID of the shared Blob Storage Private DNS zone"
  value       = module.storage_private_dns.id
}

output "firewall_id" {
  description = "Azure Firewall resource ID"
  value       = module.firewall.id
}

output "firewall_private_ip" {
  description = "Azure Firewall private IP"
  value       = module.firewall.private_ip_address
}

output "firewall_policy_id" {
  description = "Azure Firewall Policy ID"
  value       = module.firewall.policy_id
}

output "appservice_integration_subnet_id" {
  description = "Subnet used for App Service VNet Integration."
  value       = module.networking.appservice_integration_subnet_id
}

output "private_endpoint_subnet_id" {
  description = "Subnet used for private endpoints."
  value       = module.networking.private_endpoint_subnet_id
}

output "application_gateway_subnet_id" {
  description = "Subnet used for Application Gateway."
  value       = module.networking.application_gateway_subnet_id
}