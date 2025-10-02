# --- State storage ---
storage_account_resource_group = "mmfsl-automation"
storage_account_name           = "terraformautomationnew"
container_name                 = "tfstatenew"
blob                           = "vm.tfstate"

# --- SQL Server & Database ---
sql_server_name           = "kartikdata43267ser"
sql_database_name         = "kartikdata43267"
sql_admin_login           = "sqladminuser"
sql_admin_password        = "sqlpass@123"   # ⚠️ Replace with secure value
sku_type                  = "GP_S_Gen5_1"
max_size_gb               = 32
storage_account_type      = "Geo"
min_capacity              = 0.5
auto_pause_delay_in_minutes = -1

# --- Private Endpoint & DNS ---
private_endpoint_name      = "sql-pe"
private_service_name       = "sql-psc"
private_dns_zone_name      = "privatelink.database.windows.net"
dns_zone_resource_group    = "mmfsl-automation"

# --- Existing Infra ---
existing_resource_group_name = "mmfsl-automation"
existing_vnet_name           = "vnet-centralindia"
existing_subnet_name         = "snet-centralindia-1"

# --- Tags ---
common_tags = {
  "Application-Name" = "Udaan"
  "Environment"      = "Production"
  "Project-Name"     = "Udaan"
}
