output "id" {
  description = "ID of the storage account."
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "Name of the storage account."
  value       = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  description = "Primary blob service endpoint."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "primary_access_key" {
  description = "Primary access key of the storage account."
  value       = azurerm_storage_account.this.primary_access_key
  sensitive   = true
}
