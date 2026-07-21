resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
  zones = ["1", "2", "3"]

  tags = var.tags
}

resource "azurerm_virtual_network_gateway" "this" {
  name                = var.gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  bgp_enabled    = false
  sku           = var.sku

  ip_configuration {
    name                          = "gateway-ip-configuration"
    public_ip_address_id          = azurerm_public_ip.this.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet_id
  }

  vpn_client_configuration {
    address_space        = var.vpn_client_address_space
    vpn_client_protocols = var.vpn_client_protocols

    root_certificate {
      name             = var.root_certificate_name
      public_cert_data = var.root_certificate_public_data
    }
  }

  tags = var.tags
}