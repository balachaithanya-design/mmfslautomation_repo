# Storage Account Variables
resource_group_name = "mmfsl-automation"
location            = "East US"
storage_account_name = "chaithustorageacct123"
replication_type     = "GRS"
tier                 = "Standard"

# Blob Container Variables
container_name = "app-data"
access_type    = "private"

# Storage Permission Variables
role_definition_name = "Storage Blob Data Contributor"