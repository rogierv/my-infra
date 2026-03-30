# ==============================================================================
# Infrastructure
# ==============================================================================

module "resource_group" {
  source = "../../modules/resource_group"

  prefix   = var.prefix
  name     = "infra"
  env      = var.env
  location = var.location
}

module "app_insights" {
  source = "../../modules/app_insights"

  prefix                  = var.prefix
  env                     = var.env
  resource_group_name     = module.resource_group.name
  resource_group_location = module.resource_group.location
}

module "app_config" {
  source = "../../modules/app_config"

  prefix                  = var.prefix
  env                     = var.env
  resource_group_name     = module.resource_group.name
  resource_group_location = module.resource_group.location
}

module "key_vault" {
  source = "../../modules/key_vault"

  prefix                  = var.prefix
  env                     = var.env
  resource_group_name     = module.resource_group.name
  resource_group_location = module.resource_group.location
}

# ==============================================================================
# IAM
# ==============================================================================

resource "azuread_group" "developers" {
  display_name     = "${var.prefix}-aad-developers-${var.env}"
  security_enabled = true
}

resource "azuread_group_member" "developers" {
  for_each = toset(var.developer_object_ids)

  group_object_id  = azuread_group.developers.object_id
  member_object_id = each.value
}

resource "azurerm_role_assignment" "app_config_data_reader" {
  scope                = module.app_config.id
  role_definition_name = "App Configuration Data Reader"
  principal_id         = azuread_group.developers.object_id
}

resource "azurerm_role_assignment" "key_vault_secrets_officer" {
  scope                = module.key_vault.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = azuread_group.developers.object_id
}
