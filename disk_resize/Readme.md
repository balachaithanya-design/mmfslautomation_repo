azure-vm/
├── main.tf # Resources (VM, Networking, Security)
├── provider.tf # Terraform & Provider config
├── variables.tf # Input variables
├── outputs.tf # Outputs like Public IP
├── README.md # Documentation
└── ssh/
└── vmkey.pub # SSH public key


---

## ⚙️ Prerequisites
1. [Terraform](https://developer.hashicorp.com/terraform/downloads) installed  
2. [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed  
3. Login to Azure:
   ```bash
   az login




3. Generate SSH key if not available:

4. mkdir -p ssh
   ssh-keygen -t rsa -b 4096 -f ./ssh/vmkey

5.  Steps to Deploy

i- Initialize Terraform

terraform init


ii- Review plan

terraform plan


iii- Apply configuration

terraform apply -auto-approve


iv- Get VM Public IP

terraform output public_ip


v- SSH into VM

ssh -i ./ssh/vmkey azureuser@<public_ip>




### Additional Data Disk
This Terraform configuration also provisions a **20 GB managed disk** and attaches it to the VM.

- Disk name: `mmfsl-vm-datadisk`
- Size: 20 GB
- LUN: 0

After deployment, SSH into the VM and format/mount the disk:

```bash
# SSH into VM
ssh -i ./ssh/vmkey azureuser@<public_ip>

# Check new disk (likely /dev/sdc or /dev/sdb)
lsblk

# Create filesystem
sudo mkfs.ext4 /dev/sdc

# Create mount point
sudo mkdir /datadisk

# Mount disk
sudo mount /dev/sdc /datadisk

--------------------------------------

Add instructions for resizing the filesystem inside the VM:

### Resizing Attached Data Disk

The additional managed disk has been resized from 20 GB to 30 GB via Terraform.  
After applying the Terraform changes, you must expand the filesystem inside the VM.

1. SSH into the VM:
   ```bash
   ssh -i ./ssh/vmkey azureuser@<public_ip>


2. Find the disk (usually /dev/sdc or /dev/sdb):

lsblk


3. Resize the partition (if using a raw disk, skip this step):

sudo growpart /dev/sdc 1


4. Resize the filesystem:

sudo resize2fs /dev/sdc1


5. Verify:

df -h