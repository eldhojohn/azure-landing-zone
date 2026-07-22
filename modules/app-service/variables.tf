variable "service_plan_name" {
  description = "Name of the Windows App Service Plan."
  type        = string
}

variable "web_app_name" {
  description = "Globally unique name of the Windows Web App."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the App Service resources."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "sku_name" {
  description = "App Service Plan SKU."
  type        = string
  default     = "B1"
}

variable "integration_subnet_id" {
  description = "Delegated subnet used for App Service VNet Integration."
  type        = string
}

variable "dotnet_version" {
  description = "ASP.NET runtime version."
  type        = string
  default     = "v8.0"
}

variable "app_settings" {
  description = "Application settings for the Web App."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags applied to App Service resources."
  type        = map(string)
  default     = {}
}