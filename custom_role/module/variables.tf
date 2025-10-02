variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "resource_id" {
  type = string
}

variable "role_name" {
  type = string
}

variable "description" {
  type = string
}

variable "actions" {
  type = list(string)
}

variable "not_actions" {
  type = list(string)
}

variable "data_actions" {
  type = list(string)
}

variable "not_data_actions" {
  type = list(string)
}
