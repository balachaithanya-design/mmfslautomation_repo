# provider "azurerm" {
#   features {}
# }

module "linux_vm" {
  source              = "./module/linux_vm"
  resource_group_name = var.resource_group_name
  # location = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  subnet_prefix       = var.subnet_prefix
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  ssh_public_key_path = var.ssh_public_key_path
  disk_name = var.disk_name
  disk_size_gb      = var.disk_size_gb
  application_name    = var.application_name
  project_name        = var.project_name
  environment         = var.environment
  owner_name          = var.owner_name
  # data_disk_name      = var.data_disk_name
  # data_disk_size_gb   = var.data_disk_size_gb
}
