data "terraform_remote_state" "platform" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-azure-foundation"
    storage_account_name = "qpstfstate001"
    container_name       = "tfstate"
    key                  = "prod/terraform.tfstate"
  }
}

resource "azurerm_resource_group" "ropes" {
  name     = "rg-ropes-prod-aue-001"
  location = local.location
  tags     = local.tags
}

module "ropes_storage" {
  source = "../../../modules/storage"

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
  source = "../../../modules/private-endpoint"

  name                = "pep-stropes-prod-aue-001"
  location            = local.location
  resource_group_name = azurerm_resource_group.ropes.name

  subnet_id = data.terraform_remote_state.platform.outputs.workload_subnet_id

  private_connection_resource_id = module.ropes_storage.id
  subresource_names              = ["blob"]

  private_dns_zone_ids = [
    data.terraform_remote_state.platform.outputs.storage_private_dns_zone_id
  ]

  tags = merge(
    local.tags,
    {
      Workload = "Recording Platform"
    }
  )
}

module "ropes_managed_identity" {
  source = "../../../modules/managed-identity"

  name                = "id-ropes-prod-aue-001"
  location            = local.location
  resource_group_name = data.terraform_remote_state.platform.outputs.compute_resource_group_name

  tags = local.tags
}

resource "azurerm_role_assignment" "ropes_key_vault_secrets_user" {
  scope                = data.terraform_remote_state.platform.outputs.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.ropes_managed_identity.principal_id
}

resource "azurerm_role_assignment" "ropes_storage_blob_contributor" {
  scope                = module.ropes_storage.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.ropes_managed_identity.principal_id
}

