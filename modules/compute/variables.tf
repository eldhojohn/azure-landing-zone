variable "resource_group_name" {
  description = "Compute resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "management_subnet_id" {
  description = "Management subnet resource ID"
  type        = string
}

variable "vm_name" {
  description = "Azure VM resource name"
  type        = string
}

variable "computer_name" {
  description = "Windows computer name"
  type        = string
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
}

variable "admin_username" {
  description = "Local administrator username"
  type        = string
}

variable "admin_password" {
  description = "Local administrator password"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}

