output "id" {
  description = "ID of the function app."
  value       = azurerm_function_app_flex_consumption.this.id
}

output "name" {
  description = "Name of the function app."
  value       = azurerm_function_app_flex_consumption.this.name
}

output "hostname" {
  description = "Default hostname of the function app."
  value       = azurerm_function_app_flex_consumption.this.default_hostname
}

output "service_plan_id" {
  description = "ID of the service plan used by this function app."
  value       = local.service_plan_id
}

output "principal_id" {
  description = "Principal ID of the function app's SystemAssigned managed identity."
  value       = azurerm_function_app_flex_consumption.this.identity[0].principal_id
}
