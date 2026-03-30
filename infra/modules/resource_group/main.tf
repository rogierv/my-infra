resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-rg-${var.name}-${var.env}"
  location = var.location
}
