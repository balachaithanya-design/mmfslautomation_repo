# Resource Group (must already exist)
resource_group_name = "mmfsl-automation"
# location = "East US"
# Networking
vnet_name     = "my-vnet1"
address_space = ["10.0.0.0/16"]

subnet_name   = "my-subnet1"
subnet_prefix = ["10.0.1.0/24"]

# VM Details
vm_name        = "my-linux-vm1"
vm_size        = "Standard_B1s"
admin_username = "azureuser"

# Path to SSH Public Key (absolute path recommended)
ssh_public_key_path = "~/.ssh/id_rsa.pub"
disk_size_gb = 30
disk_name = "testdisk1"
application_name = "mf"
project_name     = "Mahindra AI"
environment      = "Development"
owner_name       = "Akshay"
# # Data Disk
# data_disk_name    = "mydatadisk1"
# data_disk_size_gb = 30
