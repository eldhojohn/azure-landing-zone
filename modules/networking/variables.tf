variable "resource_group_name" {
  description = "Network Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "address_space" {
  description = "Virtual Network Address Space"
  type        = list(string)
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}