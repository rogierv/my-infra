resource "azurerm_storage_account" "this" {
  name                     = "${var.prefix}st${var.name}${var.env}"
  location                 = var.resource_group_location
  resource_group_name      = var.resource_group_name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  https_traffic_only_enabled      = true
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
}
