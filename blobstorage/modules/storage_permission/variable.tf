variable "scope_id" {
  type        = string
  description = "Scope for role assignment (Storage Account or Container)"
}

variable "role_definition_name" {
  type        = string
  description = "Role to assign"
  default     = "Storage Blob Data Contributor"
}

variable "principal_id" {
  type        = string
  description = "Object ID of the Service Principal or Managed Identity"
  default     = null
}
