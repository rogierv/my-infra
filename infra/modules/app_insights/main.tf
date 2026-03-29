resource "azurerm_log_analytics_workspace" "this" {
  name                = "${var.prefix}-laws-${var.env}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_application_insights" "this" {
  name                = "${var.prefix}-appinsights-${var.env}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.this.id
}
