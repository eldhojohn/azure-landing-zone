output "service_plan_id" {
  description = "App Service Plan resource ID."
  value       = azurerm_service_plan.this.id
}

output "web_app_id" {
  description = "Windows Web App resource ID."
  value       = azurerm_windows_web_app.this.id
}

output "web_app_name" {
  description = "Windows Web App name."
  value       = azurerm_windows_web_app.this.name
}

output "default_hostname" {
  description = "Default App Service hostname."
  value       = azurerm_windows_web_app.this.default_hostname
}

output "managed_identity_principal_id" {
  description = "Principal ID of the Web App system-assigned managed identity."
  value       = azurerm_windows_web_app.this.identity[0].principal_id
}