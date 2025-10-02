
provider "azurerm" {
  features {}
}

# --- DATA BLOCKS: Fetching Existing Infrastructure Details ---

data "azurerm_resource_group" "existing" {
  name = var.existing_resource_group_name
}

data "azurerm_virtual_network" "existing" {
  name                = var.existing_vnet_name
  resource_group_name = data.azurerm_resource_group.existing.name
}

data "azurerm_subnet" "existing" {
  name                 = var.existing_subnet_name
  virtual_network_name = data.azurerm_virtual_network.existing.name
  resource_group_name  = data.azurerm_resource_group.existing.name
}




# --- SQL SERVER AND DATABASE CREATION ---

# 1. Azure SQL Server (Logical Server)
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = data.azurerm_resource_group.existing.name
  location                     = data.azurerm_resource_group.existing.location
  version                      = "12.0"

  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password

  # *** REQUIREMENT: Disable Public Access (Private Endpoint Only) ***
  public_network_access_enabled = false

  # Optional: For better performance with Private Link, ensure Connection Policy is set to 'Redirect'
  connection_policy = "Redirect"

  tags = var.common_tags
}


// Locals to determine SKU type
locals {
  is_dtu        = can(regex("^(Basic|S[0-9]+|P[0-9]+)$", var.sku_type))
  is_serverless = can(regex(".*_S_.*", var.sku_type))
  is_vcore      = can(regex(".*Gen.*", var.sku_type)) && !local.is_serverless
}


// 2. Azure SQL Database
resource "azurerm_mssql_database" "sql_database" {
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = var.sku_type
  storage_account_type = var.storage_account_type
  depends_on = [azurerm_mssql_server.sql_server]

  // max_size_gb supported by DTU, vCore, and serverless
  max_size_gb = (local.is_dtu || local.is_vcore || local.is_serverless) ? var.max_size_gb : null

  // Serverless only attributes
  min_capacity                = local.is_serverless ? var.min_capacity : null
  auto_pause_delay_in_minutes = local.is_serverless ? var.auto_pause_delay_in_minutes : null

  tags = var.common_tags
}




data "azurerm_private_dns_zone" "existing" {
  name                = var.private_dns_zone_name
  resource_group_name = var.dns_zone_resource_group
}

data "azurerm_private_dns_zone_virtual_network_link" "existing_vnet_link" {
  name                  = "sql-vnet-link"
  resource_group_name   = var.dns_zone_resource_group
  private_dns_zone_name = data.azurerm_private_dns_zone.existing.name
}

# --- Private Endpoint using existing DNS Zone and VNet Link ---
resource "azurerm_private_endpoint" "sql_private_endpoint" {
  name                = var.private_endpoint_name
  resource_group_name = data.azurerm_resource_group.existing.name
  location            = data.azurerm_resource_group.existing.location
  subnet_id           = data.azurerm_subnet.existing.id

  private_service_connection {
    name                           = var.private_service_name
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mssql_server.sql_server.id
    subresource_names              = ["sqlServer"]
  }
  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.existing.id]
  }

  depends_on = [
    azurerm_mssql_server.sql_server
  ]
  tags = var.common_tags
}



# --- OUTPUT ---

output "sql_server_fqdn" {
  description = "The fully qualified domain name of the Azure SQL Server. Inside the VNet, this resolves to the private IP."
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "private_endpoint_ip" {
  description = "The Private IP Address allocated to the SQL Server in the Private Endpoint subnet."
  value       = azurerm_private_endpoint.sql_private_endpoint.private_service_connection[0].private_ip_address
}