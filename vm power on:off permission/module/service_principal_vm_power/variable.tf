variable "app_name" {
  description = "Name for the Azure AD App / Service Principal"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where VMs exist"
  type        = string
}

variable "secret_duration" {
  description = "How long the client secret should be valid (e.g., 8760h = 1 year)"
  type        = string
  default     = "8760h"
}

