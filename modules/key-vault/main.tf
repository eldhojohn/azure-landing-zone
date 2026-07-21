resource "azurerm_key_vault" "this" {

  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id

  sku_name = var.sku_name

  rbac_authorization_enabled = var.enable_rbac_authorization

  soft_delete_retention_days = 90

  purge_protection_enabled = true

  public_network_access_enabled = false

  tags = var.tags
}