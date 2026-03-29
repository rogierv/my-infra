resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-infra-${var.env}"
  location = var.location
}
