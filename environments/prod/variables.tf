variable "vm_admin_username" {
  description = "Local administrator username for the management VM"
  type        = string
}

variable "vm_admin_password" {
  description = "Local administrator password for the management VM"
  type        = string
  sensitive   = true
}

variable "organisation" {
  description = "Organisation name"
  type        = string
}

variable "department" {
  description = "Department responsible for the platform"
  type        = string
}

variable "application_name" {
  description = "Application or platform name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "owner" {
  description = "Business or technical owner"
  type        = string
}

variable "support_team" {
  description = "Team responsible for operational support"
  type        = string
}

variable "cost_centre" {
  description = "Cost centre used for reporting and chargeback"
  type        = string
}

variable "data_classification" {
  description = "Data classification applied to the platform"
  type        = string
}

variable "criticality" {
  description = "Business criticality of the platform"
  type        = string
}

variable "p2s_root_certificate_public_data" {
  description = "Base64 public certificate data for the P2S trusted root certificate"
  type        = string
  sensitive   = true
}