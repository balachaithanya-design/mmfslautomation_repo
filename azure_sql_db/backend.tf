terraform {
  backend "azurerm" {
    resource_group_name  = var.storage_account_resource_group
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.blob
  }
}
