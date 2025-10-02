# main.tf (at root level)

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "custom_role" {
  source              = "./module"
  subscription_id     = var.subscription_id
  resource_group_name = var.resource_group_name
  resource_id         = var.resource_id
  role_name           = var.role_name
  description         = var.description
  actions             = var.actions
  not_actions         = var.not_actions
  data_actions        = var.data_actions
  not_data_actions    = var.not_data_actions
}
