variable "gateway_name" {
  description = "Name of the Azure VPN Gateway"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the VPN Gateway public IP address"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the VPN Gateway"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "gateway_subnet_id" {
  description = "Resource ID of GatewaySubnet"
  type        = string
}

variable "sku" {
  description = "VPN Gateway SKU"
  type        = string
  default     = "VpnGw1AZ"
}

variable "vpn_client_address_space" {
  description = "Address pool assigned to Point-to-Site VPN clients"
  type        = list(string)

  validation {
    condition     = length(var.vpn_client_address_space) > 0
    error_message = "At least one VPN client address range must be provided."
  }
}

variable "vpn_client_protocols" {
  description = "Protocols supported by the Point-to-Site VPN"
  type        = list(string)
}

variable "root_certificate_name" {
  description = "Name of the trusted Point-to-Site root certificate"
  type        = string
}

variable "root_certificate_public_data" {
  description = "Base64 certificate body from the trusted root certificate"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags applied to VPN resources"
  type        = map(string)
  default     = {}
}

