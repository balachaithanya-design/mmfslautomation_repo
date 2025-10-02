variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "location" {
  type        = string
  description = "Azure location for VM"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "vm_size" {
  type        = string
  description = "Size of the VM"
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for VM"
  default     = "azureuser"
}

# variable "ssh_public_key" {
#   type        = string
#   description = "SSH public key for login"
# }

# variable "network_interface_id" {
#   type        = string
#   description = "Network Interface ID to attach"
# }

# variable "image_publisher" {
#   type    = string
#   default = "Canonical"
# }

# variable "image_offer" {
#   type    = string
#   default = "UbuntuServer"
# }

# variable "image_sku" {
#   type    = string
#   default = "20_04-lts-gen2"
# }

# variable "image_version" {
#   type    = string
#   default = "latest"
# }


variable "custom_image_id" {
  type        = string
  description = "Custom image ID for the VM"
}

variable "mf1_password" {
  type        = string
  description = "Password for mf1 user"
  sensitive   = true
}

variable "mf2_password" {
  type        = string
  description = "Password for mf2 user"
  sensitive   = true
}

variable "admin_password" {
  type        = string
  description = "Admin password for VM"
  sensitive   = true
}
