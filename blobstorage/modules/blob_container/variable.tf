variable "storage_account_name" {
  type        = string
  description = "Storage account name"
}

variable "container_name" {
  type        = string
  description = "Name of the blob container"
}

variable "access_type" {
  type        = string
  default     = "private"
}
