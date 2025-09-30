#storage account
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
#blob container

variable "container_name" {
  type        = string
  description = "Blob container name"
}

variable "access_type" {
  type        = string
  default     = "private"
  description = "Blob container access type"
}   
#storage permission
variable "role_definition_name" {
  type        = string
  description = "Role to assign"
  default     = "Storage Blob Data Contributor"
}

# variable "principal_id" {
#   type        = string
#   description = "Object ID of the Service Principal or Managed Identity"
#   default     = null
# }

   