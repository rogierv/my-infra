output "id" {
  description = "ID of the function app."
  value       = azurerm_linux_function_app.this.id
}

output "name" {
  description = "Name of the function app."
  value       = azurerm_linux_function_app.this.name
}

output "hostname" {
  description = "Default hostname of the function app."
  value       = azurerm_linux_function_app.this.default_hostname
}

output "service_plan_id" {
  description = "ID of the service plan used by this function app."
  value       = local.service_plan_id
}
