locals {
  service_plan_id = var.service_plan_id != null ? var.service_plan_id : azurerm_service_plan.this[0].id
}

resource "azurerm_service_plan" "this" {
  count = var.service_plan_id == null ? 1 : 0

  name                = "${var.prefix}-asp-${var.name}-${var.env}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "FC1"
}

resource "azurerm_storage_container" "this" {
  name                  = "${var.prefix}-func-${var.name}-${var.env}"
  storage_account_id    = var.storage_account_id
  container_access_type = "private"
}

resource "azurerm_function_app_flex_consumption" "this" {
  name                = "${var.prefix}-func-${var.name}-${var.env}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = local.service_plan_id

  storage_container_type      = "blobContainer"
  storage_container_endpoint  = "${var.storage_account_primary_blob_endpoint}${azurerm_storage_container.this.name}"
  storage_authentication_type = "StorageAccountConnectionString"
  storage_access_key          = var.storage_account_access_key

  runtime_name          = var.runtime_name
  runtime_version       = var.runtime_version
  instance_memory_in_mb = var.instance_memory_in_mb

  https_only = true

  app_settings = var.app_settings

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_insights_connection_string = var.app_insights_connection_string
  }
}
