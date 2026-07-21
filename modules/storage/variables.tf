variable "name" {
  description = "Storage Account name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "account_tier" {
  description = "Storage account performance tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage replication"
  type        = string
  default     = "LRS"
}

variable "account_kind" {
  description = "Storage account kind"
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "Default access tier"
  type        = string
  default     = "Hot"
}

variable "public_network_access_enabled" {
  description = "Enable public network access"
  type        = bool
  default     = true
}

variable "shared_access_key_enabled" {
  description = "Enable Shared Key authentication"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "containers" {
  description = "Blob containers to create"
  type        = set(string)
  default     = []
}