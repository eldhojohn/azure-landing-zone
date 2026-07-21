variable "zone_name" {
  description = "Private DNS Zone name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group"
  type        = string
}

variable "virtual_network_id" {
  description = "Virtual Network ID"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}