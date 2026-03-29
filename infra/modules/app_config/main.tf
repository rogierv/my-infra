resource "azurerm_app_configuration" "this" {
  name                = "${var.prefix}-appconfig-${var.env}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
}
