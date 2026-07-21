variable "name" {
  description = "Private Endpoint name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet for the Private Endpoint"
  type        = string
}

variable "private_connection_resource_id" {
  description = "Azure resource ID to connect privately"
  type        = string
}

variable "subresource_names" {
  description = "Private Link subresource names"
  type        = list(string)
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "private_dns_zone_ids" {
  description = "Private DNS zone IDs associated with the private endpoint"
  type        = list(string)
  default     = []
}