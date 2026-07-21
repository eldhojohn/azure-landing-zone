output "id" {
  description = "Storage Account ID"
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "Storage Account name"
  value       = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  description = "Blob endpoint"
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "principal_id" {
  description = "Managed Identity Principal ID"
  value       = azurerm_storage_account.this.identity[0].principal_id
}