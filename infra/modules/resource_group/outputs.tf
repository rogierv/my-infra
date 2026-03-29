output "name" {
  description = "Name of the resource group."
  value       = azurerm_resource_group.this.name
}

output "location" {
  description = "Azure location of the resource group."
  value       = azurerm_resource_group.this.location
}
