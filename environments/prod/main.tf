module "networking" {
  source = "../../modules/networking"

  resource_group_name = "rg-network-prod-aue-001"
  location            = "Australia East"
  vnet_name           = "vnet-hub-prod-aue-001"
  address_space       = ["10.0.0.0/16"]

  tags = local.tags
}