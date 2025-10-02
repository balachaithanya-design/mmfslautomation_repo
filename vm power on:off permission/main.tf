provider "azurerm" {
  features {}
  subscription_id = "eb2887d7-d11e-492d-88cb-7b4f39e868a8"
}

provider "azuread" {
}

data "azurerm_client_config" "current" {}

module "vm_power_sp" {
  source              = "./module/service_principal_vm_power"
  app_name            = var.app_name
  resource_group_name = var.resource_group_name
  secret_duration     = var.secret_duration
}
