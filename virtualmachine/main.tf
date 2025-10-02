terraform {
  required_version = ">= 1.1.0"

#   backend "azurerm" {
#     resource_group_name  = "tfstate-rg"
#     storage_account_name = "tfstatestorage"
#     container_name       = "tfstate"
#     key                  = "vm_creation.tfstate"
#   }

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

module "vm" {
  source              = "./modules/vm"
  vm_name             = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
#   ssh_public_key      = var.ssh_public_key
#   network_interface_id = var.network_interface_id

#   image_publisher = var.image_publisher
#   image_offer     = var.image_offer
#   image_sku       = var.image_sku
#   image_version   = var.image_version

  custom_image_id = var.custom_image_id
  mf1_password    = var.mf1_password
  mf2_password    = var.mf2_password
}


