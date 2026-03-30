locals {
  service_plan_id = var.service_plan_id != null ? var.service_plan_id : azurerm_service_plan.this[0].id
}

resource "azurerm_service_plan" "this" {
  count = var.service_plan_id == null ? 1 : 0

  name                = "${var.prefix}-asp-${var.name}-${var.env}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.sku_name
}

resource "azurerm_linux_function_app" "this" {
  name                = "${var.prefix}-func-${var.name}-${var.env}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = local.service_plan_id

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key

  https_only = true

  app_settings = var.app_insights_connection_string != null ? {
    APPLICATIONINSIGHTS_CONNECTION_STRING = var.app_insights_connection_string
  } : {}

  site_config {
    application_stack {
      dotnet_version          = var.runtime_name == "dotnet" ? var.runtime_version : null
      python_version          = var.runtime_name == "python" ? var.runtime_version : null
      node_version            = var.runtime_name == "node" ? var.runtime_version : null
      java_version            = var.runtime_name == "java" ? var.runtime_version : null
      powershell_core_version = var.runtime_name == "powershell" ? var.runtime_version : null
    }
  }
}
