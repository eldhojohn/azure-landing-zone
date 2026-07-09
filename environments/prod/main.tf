module "resource_groups" {
  source = "../../modules/resource-groups"

  location = local.location
  tags     = local.tags
}

module "networking" {
  source = "../../modules/networking"

  resource_group_name = module.resource_groups.network_rg_name
  location            = "Australia East"
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

  tags = local.tags
}