variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "management_subnet_id" {
  type = string
}

variable "workload_subnet_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "admin_public_ip_cidrs" {
  description = "Public administrator IP allowed to access management systems"
  type        = list(string)
}