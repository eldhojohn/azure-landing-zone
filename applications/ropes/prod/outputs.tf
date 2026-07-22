output "ropes_managed_identity_id" {
  description = "ROPES managed identity resource ID"
  value       = module.ropes_managed_identity.id
}

output "ropes_managed_identity_client_id" {
  description = "ROPES managed identity client ID"
  value       = module.ropes_managed_identity.client_id
}

output "ropes_managed_identity_principal_id" {
  description = "ROPES managed identity principal ID"
  value       = module.ropes_managed_identity.principal_id
}