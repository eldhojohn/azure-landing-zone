variable "key_vault_name" {
  description = "Key Vault name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "tags" {
  type = map(string)
}

variable "enable_rbac_authorization" {
  type    = bool
  default = true
}

variable "sku_name" {
  type    = string
  default = "standard"
}