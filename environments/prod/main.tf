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

#module "bastion" {
# source = "../../modules/bastion"
#
# name                = "bas-hub-prod-aue-001"
#public_ip_name      = "pip-bas-hub-prod-aue-001"
#location            = local.location
#resource_group_name = module.resource_groups.network_rg_name
#subnet_id           = module.networking.bastion_subnet_id
#sku                 = "Standard"
#
# tags = local.tags
#}


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

  depends_on = [
    module.key_vault,
    module.log_analytics
  ]
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

  depends_on = [
    module.vpn_gateway,
    module.log_analytics
  ]
}

# ------------------------------------------------------------
# TEMPORARY APPLICATION RESOURCES
# These ROPES resources will be moved to a separate Terraform
# root module and state in a controlled migration.
# ------------------------------------------------------------

resource "azurerm_resource_group" "ropes" {
  name     = "rg-ropes-prod-aue-001"
  location = local.location
  tags     = local.tags
}

module "ropes_storage" {
  source = "../../modules/storage"

  name                = "stropesprodaue001"
  resource_group_name = azurerm_resource_group.ropes.name
  location            = azurerm_resource_group.ropes.location

  containers = [
    "incoming",
    "processed",
    "failed",
    "archive"
  ]

  tags = merge(
    local.tags,
    {
      Workload = "Recording Platform"
    }
  )
}

module "ropes_storage_private_endpoint" {
  source = "../../modules/private-endpoint"

  name                = "pep-stropes-prod-aue-001"
  location            = local.location
  resource_group_name = azurerm_resource_group.ropes.name
  subnet_id           = module.networking.workload_subnet_id

  private_connection_resource_id = module.ropes_storage.id
  subresource_names              = ["blob"]

  private_dns_zone_ids = [
    module.storage_private_dns.id
  ]

  tags = merge(
    local.tags,
    {
      Workload = "Recording Platform"
    }
  )
}

module "storage_private_dns" {
  source = "../../modules/private-dns"

  zone_name           = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.ropes.name

  virtual_network_id = module.networking.vnet_id

  tags = merge(
    local.tags,
    {
      Workload = "Recording Platform"
    }
  )
}

# ------------------------------------------------------------