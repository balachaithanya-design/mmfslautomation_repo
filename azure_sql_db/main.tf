terraform {
  required_version = ">= 1.7.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80"
    }
  }
}

provider "azurerm" {
  features {}
}

# --- Call the SQL Module ---
module "sql_database" {
  source = "./modules/sql_database"

  # SQL Server & DB
  sql_server_name           = var.sql_server_name
  sql_database_name         = var.sql_database_name
  sql_admin_login           = var.sql_admin_login
  sql_admin_password        = var.sql_admin_password
  sku_type                  = var.sku_type
  max_size_gb               = var.max_size_gb
  storage_account_type      = var.storage_account_type
  min_capacity              = var.min_capacity
  auto_pause_delay_in_minutes = var.auto_pause_delay_in_minutes

  # Private endpoint
  private_endpoint_name = var.private_endpoint_name
  private_service_name  = var.private_service_name
  private_dns_zone_name = var.private_dns_zone_name
  dns_zone_resource_group = var.dns_zone_resource_group

  # Existing infra
  existing_resource_group_name = var.existing_resource_group_name
  existing_vnet_name           = var.existing_vnet_name
  existing_subnet_name         = var.existing_subnet_name

  # Tags
  common_tags = var.common_tags
}

# --- Outputs ---
output "sql_server_fqdn" {
  value = module.sql_database.sql_server_fqdn
}

output "private_endpoint_ip" {
  value = module.sql_database.private_endpoint_ip
}
