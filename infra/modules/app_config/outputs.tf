output "id" {
  description = "ID of the App Configuration store."
  value       = azurerm_app_configuration.this.id
}

output "endpoint" {
  description = "Endpoint of the App Configuration store."
  value       = azurerm_app_configuration.this.endpoint
}

output "primary_read_key" {
  description = "Primary read access key for the App Configuration store."
  value       = azurerm_app_configuration.this.primary_read_key
  sensitive   = true
}

output "primary_write_key" {
  description = "Primary write access key for the App Configuration store."
  value       = azurerm_app_configuration.this.primary_write_key
  sensitive   = true
}
