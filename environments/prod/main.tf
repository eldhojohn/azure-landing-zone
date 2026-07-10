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
  admin_public_ip_cidr = "124.148.89.198/32"

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