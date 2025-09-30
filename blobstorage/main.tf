terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Storage Account Module
module "storage_account" {
  source              = "./modules/storage_account"
  resource_group_name = var.resource_group_name
  location            = var.location 
  storage_account_name = var.storage_account_name 
  replication_type     = var.replication_type 
  tier                 = var.tier 
  tags = {
    environment = "dev"
    owner       = "cloud-team"
  }
}

# Blob Container Module
module "blob_container" {
  source               = "./modules/blob_container"
  storage_account_name = module.storage_account.storage_account_name
  container_name       = var.container_name 
  access_type          = var.access_type 
}

# Storage Permission Module
module "storage_permission" {
  source              = "./modules/storage_permission"
  scope_id            = module.storage_account.storage_account_id
  role_definition_name = var.role_definition_name 
  #principal_id        = "<service-principal-object-id>" # from Azure AD
}
