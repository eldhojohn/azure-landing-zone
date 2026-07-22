variable "firewall_name" {
  description = "Name of the Azure Firewall."
  type        = string
}

variable "firewall_policy_name" {
  description = "Name of the Azure Firewall Policy."
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Azure Firewall public IP address."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the firewall resources will be created."
  type        = string
}

variable "location" {
  description = "Azure region where the firewall resources will be created."
  type        = string
}

variable "subnet_id" {
  description = "Resource ID of AzureFirewallSubnet."
  type        = string
}

variable "sku_name" {
  description = "Azure Firewall SKU name."
  type        = string
  default     = "AZFW_VNet"

  validation {
    condition     = contains(["AZFW_VNet", "AZFW_Hub"], var.sku_name)
    error_message = "sku_name must be either AZFW_VNet or AZFW_Hub."
  }
}

variable "sku_tier" {
  description = "Azure Firewall SKU tier."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku_tier)
    error_message = "sku_tier must be Basic, Standard, or Premium."
  }
}

variable "tags" {
  description = "Tags to apply to the firewall resources."
  type        = map(string)
  default     = {}
}
