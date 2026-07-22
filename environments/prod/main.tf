data "azurerm_client_config" "current" {}

module "resource_groups" {
  source = "../../modules/resource-groups"

  location = local.location
  tags     = local.tags
}

module "networking" {
  source = "../../modules/networking"

  resource_group_name = module.resource_groups.network_rg_name
  location            = local.location
  vnet_name           = "vnet-hub-prod-aue-001"
  address_space       = ["10.0.0.0/16"]

  tags = local.tags
}

module "nsg" {
  source = "../../modules/nsg"

  resource_group_name  = module.resource_groups.network_rg_name
  location             = local.location
  management_subnet_id = module.networking.management_subnet_id
  workload_subnet_id   = module.networking.workload_subnet_id

  admin_public_ip_cidrs = [
    "124.148.89.198/32",
    "131.242.133.131/32"
  ]

  tags = local.tags
}

module "route_tables" {
  source = "../../modules/route-tables"

  resource_group_name  = module.resource_groups.network_rg_name
  location             = local.location
  management_subnet_id = module.networking.management_subnet_id
  workload_subnet_id   = module.networking.workload_subnet_id
  firewall_private_ip  = module.firewall.private_ip_address

  tags = local.tags
}

module "compute" {
  source = "../../modules/compute"

  resource_group_name  = module.resource_groups.compute_rg_name
  location             = local.location
  management_subnet_id = module.networking.management_subnet_id

  vm_name       = "vm-mgmt01-prod-aue-001"
  computer_name = "MGMT01"
  vm_size       = "Standard_B2as_v2"

  admin_username = var.vm_admin_username
  admin_password = var.vm_admin_password

  tags = local.tags
}

# Bastion is currently disabled.
#
# module "bastion" {
#   source = "../../modules/bastion"
#
#   name                = "bas-hub-prod-aue-001"
#   public_ip_name      = "pip-bas-hub-prod-aue-001"
#   location            = local.location
#   resource_group_name = module.resource_groups.network_rg_name
#   subnet_id           = module.networking.bastion_subnet_id
#   sku                 = "Standard"
#
#   tags = local.tags
# }

module "vpn_gateway" {
  source = "../../modules/vpn-gateway"

  gateway_name        = "vgw-hub-prod-aue-001"
  public_ip_name      = "pip-vgw-hub-prod-aue-001"
  resource_group_name = module.resource_groups.network_rg_name
  location            = local.location
  gateway_subnet_id   = module.networking.gateway_subnet_id

  sku = "VpnGw1AZ"

  vpn_client_address_space = [
    "172.16.0.0/24"
  ]

  vpn_client_protocols = [
    "IkeV2",
    "OpenVPN"
  ]

  root_certificate_name        = "QPS-P2S-RootCert"
  root_certificate_public_data = var.p2s_root_certificate_public_data

  tags = local.tags
}

module "key_vault" {
  source = "../../modules/key-vault"

  key_vault_name      = "kv-qps-prod-aue-001"
  resource_group_name = module.resource_groups.security_rg_name
  location            = local.location
  tenant_id           = data.azurerm_client_config.current.tenant_id

  enable_rbac_authorization = true
  sku_name                  = "standard"

  tags = local.tags
}

resource "azurerm_role_assignment" "key_vault_administrator" {
  scope                = module.key_vault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

module "key_vault_private_dns" {
  source = "../../modules/private-dns"

  zone_name           = "privatelink.vaultcore.azure.net"
  resource_group_name = module.resource_groups.security_rg_name
  virtual_network_id  = module.networking.vnet_id

  tags = local.tags
}

module "key_vault_private_endpoint" {
  source = "../../modules/private-endpoint"

  name                = "pep-kv-qps-prod-aue-001"
  location            = local.location
  resource_group_name = module.resource_groups.security_rg_name
  subnet_id           = module.networking.workload_subnet_id

  private_connection_resource_id = module.key_vault.id

  subresource_names = [
    "vault"
  ]

  private_dns_zone_ids = [
    module.key_vault_private_dns.id
  ]

  tags = local.tags
}

module "log_analytics" {
  source = "../../modules/log-analytics"

  name                = "law-platform-prod-aue-001"
  resource_group_name = module.resource_groups.monitoring_rg_name
  location            = local.location

  sku               = "PerGB2018"
  retention_in_days = 30
  daily_quota_gb    = 1

  internet_ingestion_enabled = true
  internet_query_enabled     = true

  tags = local.tags
}

module "key_vault_diagnostics" {
  source = "../../modules/diagnostic-settings"

  name                       = "diag-key-vault-to-law"
  target_resource_id         = module.key_vault.id
  log_analytics_workspace_id = module.log_analytics.id

  log_category_groups = [
    "allLogs"
  ]

  metric_categories = [
    "AllMetrics"
  ]

  log_analytics_destination_type = "Dedicated"
}

module "vpn_gateway_diagnostics" {
  source = "../../modules/diagnostic-settings"

  name                       = "diag-vpn-gateway-to-law"
  target_resource_id         = module.vpn_gateway.id
  log_analytics_workspace_id = module.log_analytics.id

  log_category_groups = [
    "allLogs"
  ]

  metric_categories = [
    "AllMetrics"
  ]

  log_analytics_destination_type = "Dedicated"
}

module "storage_private_dns" {
  source = "../../modules/private-dns"

  zone_name           = "privatelink.blob.core.windows.net"
  resource_group_name = module.resource_groups.security_rg_name
  virtual_network_id  = module.networking.vnet_id

  tags = local.tags
}

module "firewall" {
  source = "../../modules/firewall"

  firewall_name        = "afw-hub-prod-aue-001"
  firewall_policy_name = "afwp-hub-prod-aue-001"
  public_ip_name       = "pip-afw-hub-prod-aue-001"

  resource_group_name = module.resource_groups.network_rg_name
  location            = local.location

  subnet_id = module.networking.firewall_subnet_id

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"

  tags = local.tags
}

module "firewall_diagnostics" {
  source = "../../modules/diagnostic-settings"

  name                       = "diag-azure-firewall-to-law"
  target_resource_id         = module.firewall.id
  log_analytics_workspace_id = module.log_analytics.id

  log_category_groups = [
    "allLogs"
  ]

  metric_categories = [
    "AllMetrics"
  ]

  log_analytics_destination_type = "Dedicated"
}
