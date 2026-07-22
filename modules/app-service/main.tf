resource "azurerm_service_plan" "this" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location

  os_type  = "Windows"
  sku_name = var.sku_name

  tags = var.tags
}

resource "azurerm_windows_web_app" "this" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.this.id

  https_only = true

  virtual_network_subnet_id = var.integration_subnet_id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on           = true
    minimum_tls_version = "1.2"
    ftps_state          = "Disabled"

    application_stack {
      current_stack  = "dotnet"
      dotnet_version = var.dotnet_version
    }
  }

  app_settings = merge(
    {
      "WEBSITE_VNET_ROUTE_ALL" = "1"
    },
    var.app_settings
  )

  client_certificate_enabled                 = false
  ftp_publish_basic_authentication_enabled   = false
  webdeploy_publish_basic_authentication_enabled = false

  tags = var.tags
}