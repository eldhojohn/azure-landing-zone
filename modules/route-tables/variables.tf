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

variable "firewall_private_ip" {
  description = "Private IP address of the Azure Firewall used as the workload default-route next hop."
  type        = string
}