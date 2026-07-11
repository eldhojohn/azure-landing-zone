variable "name" {
  description = "Name of the Azure Bastion host"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group in which the Bastion resources will be deployed"
  type        = string
}

variable "location" {
  description = "Azure region for the Bastion resources"
  type        = string
}

variable "subnet_id" {
  description = "Resource ID of the existing AzureBastionSubnet"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Bastion public IP address"
  type        = string
}

variable "sku" {
  description = "Azure Bastion SKU"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "The Bastion SKU must be Basic, Standard, or Premium."
  }
}

variable "tags" {
  description = "Tags applied to Bastion resources"
  type        = map(string)
  default     = {}
}