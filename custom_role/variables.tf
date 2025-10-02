variable "subscription_id" {
  description = "Subscription ID for the role scope"
  type        = string
}

variable "resource_group_name" {
  description = "Optional resource group name for the role scope"
  type        = string
}

variable "resource_id" {
  description = "Optional resource ID for the role scope (specific resource)"
  type        = string
}

variable "role_name" {
  description = "Name of the custom role"
  type        = string
}

variable "description" {
  description = "Description of the custom role"
  type        = string
}

variable "actions" {
  description = "List of allowed management-plane actions"
  type        = list(string)
}

variable "not_actions" {
  description = "List of denied management-plane actions"
  type        = list(string)
}

variable "data_actions" {
  description = "List of allowed data-plane actions"
  type        = list(string)
}

variable "not_data_actions" {
  description = "List of denied data-plane actions"
  type        = list(string)
}
