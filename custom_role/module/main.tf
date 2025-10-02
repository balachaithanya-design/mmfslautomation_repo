terraform {
  required_version = ">= 1.7.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.46"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Determine the scope dynamically
locals {
  scope = (
    length(trim(var.resource_id, " ")) > 0 ? var.resource_id :
    length(trim(var.resource_group_name, " ")) > 0 ? "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}" :
    "/subscriptions/${var.subscription_id}"
  )
}

resource "azurerm_role_definition" "custom_role" {
  name        = var.role_name
  scope       = local.scope
  description = var.description

  permissions {
    actions          = var.actions
    not_actions      = var.not_actions
    data_actions     = var.data_actions
    not_data_actions = var.not_data_actions
  }

  assignable_scopes = [local.scope]
}
