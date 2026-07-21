variable "name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sku" {
  description = "Log Analytics Workspace pricing SKU"
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Log retention period in days"
  type        = number
  default     = 30

  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "Retention must be between 30 and 730 days."
  }
}

variable "daily_quota_gb" {
  description = "Daily ingestion quota in GB. Use -1 for unlimited."
  type        = number
  default     = 1
}

variable "internet_ingestion_enabled" {
  description = "Allow ingestion from public networks"
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "Allow queries from public networks"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to the Log Analytics Workspace"
  type        = map(string)
  default     = {}
}