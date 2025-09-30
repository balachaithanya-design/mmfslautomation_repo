variable "resource_group_name" {
  type        = string
  description = "Resource group where storage account will be created"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "storage_account_name" {
  type        = string
  description = "Globally unique name for the storage account"
}

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "replication_type" {
  type        = string
  default     = "LRS" # Locally Redundant Storage
}

variable "tier" {
  type        = string
  default     = "Standard"
}
