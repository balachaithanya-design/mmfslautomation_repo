variable "resource_group_name" {}
# variable "location" {
  
# }
variable "vnet_name" {}
variable "address_space" {
  type = list(string)
}
variable "subnet_name" {}
variable "subnet_prefix" {
  type = list(string)
}
variable "vm_name" {}
variable "vm_size" {}
variable "admin_username" {}
variable "ssh_public_key_path" {}
variable "disk_size_gb" {
}
variable "application_name" {
  description = "Application name for tagging"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "environment" {
  description = "Environment (e.g., Dev, QA, Prod)"
  type        = string
}
variable "disk_name" {
  
}

variable "owner_name" {
  description = "Owner name for tagging"
  type        = string
}
# variable "data_disk_name" {}
# variable "data_disk_size_gb" {
#   type    = number
# }
