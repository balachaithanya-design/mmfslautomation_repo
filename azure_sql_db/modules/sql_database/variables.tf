


####### SQL server and database configuration #########

variable "sql_server_name" {
  description = "Name of the new SQL Server"
  type        = string
}

variable "sql_database_name" {
  description = "Name of the SQL database"
  type        = string
}

variable "sql_admin_login" {
  description = "The administrator login name for the SQL Server"
  type        = string
}

variable "sql_admin_password" {
  description = "Admin password for SQL Server"
  type        = string
  sensitive   = true
}

variable "sku_type" {
  description = "SKU type for SQL database"
  type        = string
}

variable "max_size_gb" {
  description = "Maximum database size in GB"
  type        = number
}

variable "storage_account_type" {
  description = "Storage account type for SQL database (e.g., Geo)"
  type        = string
}

variable "min_capacity" {
  description = "Minimal vCore capacity that database will always have allocated, if not paused (serverless only)"
  type        = number
}

variable "auto_pause_delay_in_minutes" {
  description = "Time in minutes after which database is automatically paused. Use -1 to disable auto pause (serverless only)"
  type        = number
}


####### Private endpoint and DNS #########

variable "private_endpoint_name" {
  description = "Private endpoint name"
  type        = string
}

variable "private_service_name" {
  description = "Private service connection name"
  type        = string
}

variable "private_dns_zone_name" {
  description = "The name of the existing Private DNS Zone"
  type        = string
}

variable "dns_zone_resource_group" {
  description = "Resource group of the existing Private DNS Zone"
  type        = string
}


####### Existing infrastructure #########

variable "existing_resource_group_name" {
  description = "Name of the existing resource group"
  type        = string
}

variable "existing_vnet_name" {
  description = "Name of the existing VNet"
  type        = string
}

variable "existing_subnet_name" {
  description = "Name of the existing subnet"
  type        = string
}


########## Tags #########

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
}































// ####### state file storage details and storage account ########

// variable "storage_account_resource_group" {
//   description = "storage account state file resource group"
//   type        = string
//   default     = "mmfsl-automation"
// }
// variable "storage_account_name" {
//   description = "storageaccount for statefile"
//   type        = string
//   default     = "terraformautomationnew"
// }
// variable "container_name" {
//   description = "storageaccount container for statefile"
//   type        = string
//   default     = "tfstatenew"
// }
// variable "blob" {
//   description = "storageaccount container blob for statefile"
//   type        = string
//   default     = "vm.tfstate"
// }



// ####### sql server and database details and configuration values #########

// variable "sql_server_name" {
//   description = "Name of the new SQL Server"
//   type        = string
//   default     = "kartikdata43267ser"
// }

// variable "sql_database_name" {
//   description = "Name of the SQL database"
//   type        = string
//   default     = "kartikdata43267"
// }

// variable "sql_admin_login" {
//   description = "The administrator login name for the SQL Server"
//   type        = string
//   default     = "sqladminuser"
// }

// variable "sql_admin_password" {
//   description = "Admin password"
//   type        = string
//   sensitive   = true
//   default     = "sqlpass@123" # ⚠️ not recommended for production
// }

// variable "sku_type" {
//   description = "sku type"
//   type        = string
//   default     = "GP_S_Gen5_1"
// }
// variable "max_size_gb" {
//   description = "maximum size of cb"
//   type        = number
//   default     = 32
// }
// variable "storage_account_type" {
//   description = "storageaccount account type Geo redundent"
//   type        = string
//   default     = "Geo"
// }
// variable "min_capacity" {
//   description = "Minimal vCore capacity that database will always have allocated, if not paused (e.g., 0.5 vCore)."
//   type        = number
//   default     = 0.5
// }
// variable "auto_pause_delay_in_minutes" {
//   description = "Time in minutes after which database is automatically paused. Use -1 to disable auto pause."
//   type        = number
//   default     = -1 # no automatic Pause
// }



// #######. private endpoint and private dns zone and service connection details ########

// variable "private_endpoint_name" {
//   description = "private endpoint name"
//   type        = string
//   default     = "sql-pe"
// }
// variable "private_service_name" {
//   description = "private service_connection name"
//   type        = string
//   default     = "sql-psc"
// }
// variable "private_dns_zone_name" {
//   description = "The name of the existing Private DNS Zone"
//   type        = string
//   default     = "privatelink.database.windows.net"
// }

// variable "dns_zone_resource_group" {
//   description = "Resource group of the existing Private DNS Zone"
//   type        = string
//   default     = "mmfsl-automation"
// }




// #######. resource group vnet and subnet details ##########


// variable "existing_resource_group_name" {
//   description = "Name of the existing resource group"
//   type        = string
//   default     = "mmfsl-automation"
// }

// variable "existing_vnet_name" {
//   description = "Name of the existing VNet"
//   type        = string
//   default     = "vnet-centralindia"
// }

// variable "existing_subnet_name" {
//   description = "Name of the existing subnet"
//   type        = string
//   default     = "snet-centralindia-1"
// }



// ########## tags details ########

// variable "common_tags" {
//   description = "Common tags to be applied to all resources"
//   type        = map(string)
//   default = {
//     "Application-Name"       = ""
//     "Environment"     = ""
//     "Project-Name"      = ""
    
//   }
// }



