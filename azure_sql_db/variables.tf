# azure_sql_db/variables.tf

# State storage
variable "storage_account_resource_group" { type = string }
variable "storage_account_name" { type = string }
variable "container_name" { type = string }
variable "blob" { type = string }

# SQL Server & Database
variable "sql_server_name" { type = string }
variable "sql_database_name" { type = string }
variable "sql_admin_login" { type = string }
variable "sql_admin_password" { 
    type = string 
    sensitive = true 
    }
variable "sku_type" { type = string }
variable "max_size_gb" { type = number }
variable "storage_account_type" { type = string }
variable "min_capacity" { type = number }
variable "auto_pause_delay_in_minutes" { type = number }

# Private endpoint
variable "private_endpoint_name" { type = string }
variable "private_service_name" { type = string }
variable "private_dns_zone_name" { type = string }
variable "dns_zone_resource_group" { type = string }

# Existing infra
variable "existing_resource_group_name" { type = string }
variable "existing_vnet_name" { type = string }
variable "existing_subnet_name" { type = string }

# Tags
variable "common_tags" { type = map(string) }
