variable "resource_group_name" {
  description = "Existing resource group name"
  type        = string
  default     = "mmfsl-iht-dev-app-nw-rg"
}

variable "network_resource_group" {
  description = "Resource group where the VNet/Subnet exists"
  type        = string
  default     = "mmfsl-iht-dev-app-nw-rg"
}

variable "location" {
  type    = string
  default = "centralindia"
}

variable "vnet_name" {
  description = "Existing virtual network name"
  type        = string
  default     = "mmfsl-iht-dev-app-spoke-vnet"
}

variable "subnet_name" {
  description = "Existing subnet name"
  type        = string
  default     = "aks-subnet"
}

variable "vm_name" {
  description = "Name for the new VM"
  type        = string
  default     = "mf-sandbox-45"
}

variable "vm_size" {
  description = "VM SKU / size"
  type        = string
  default     = "Standard_E64as_v5"
}

variable "admin_username" {
  type    = string
  default = "DataAnalytics"
}

variable "admin_password" {
  description = "Admin password (sensitive)"
  type        = string
  sensitive   = true
}

variable "mf1_password" {
  description = "Password to create MF-100007953 (cloud-init will set it)"
  type      = string
  sensitive = true
}

variable "mf2_password" {
  description = "Password to create MF-100007954 (cloud-init will set it)"
  type      = string
  sensitive = true
}

variable "os_disk_size_gb" {
  type    = number
  default = 35
}

variable "os_disk_type" {
  type    = string
  default = "StandardSSD_LRS"
}

variable "tags" {
  type = map(string)
  default = {
    "Project-Name" = "Mahindra AI"
    "Environment"  = "Development"
    "Application-Name"   = "Sandbox"
    "Owner-name"   = "Aditya Desai : aditya.desai@mahindrafinance.com"
  }
}

variable "custom_image_id" {
  description = "Name: MMFS-NSGSPOOLER-image-20250709160725"
  type        = string
}