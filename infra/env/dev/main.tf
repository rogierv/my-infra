module "resource_group" {
  source = "../../modules/resource_group"

  prefix   = var.prefix
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
