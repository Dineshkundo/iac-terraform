# -------------------------
# Azure Subscription Context
# -------------------------
subscription_id = "d629b553-466f-4caa-b64b-9ba2bae97c3f"
tenant_id       = "2eb52881-f5b4-4855-9142-cd907aa33267"

# -------------------------
# Resource Group & Location
# -------------------------
resource_group_name = "CODA_RG"
location            = "eastus"

# -------------------------
# Virtual Machine
# -------------------------
vm_name = "RedhatServerUAT"
vm_size = "Standard_B4ms"

admin_username = "adminuser"

# -------------------------
# Existing Azure Resources
# -------------------------
nic_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/networkInterfaces/redhatnicuat"

os_disk_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Compute/disks/RedhatServerUAT_OsDisk_1_38d0ae3506f1438a86465681d63473fc"

data_disk_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Compute/disks/RedhatServerUAT-datadisk1"

# Only used if resizing data disk in future
data_disk_size_gb = 64

# -------------------------
# Image (for state alignment only)
# -------------------------
image_publisher = "RedHat"
image_offer     = "RHEL"
image_sku       = "7lvm-gen2"
image_version   = "latest"

# -------------------------
# Tags
# -------------------------
tags = {
  Env = "UAT"
}

# -------------------------
# VMAccess Extension (Safe Defaults)
# -------------------------
ext_username    = ""
ext_password    = ""
ext_ssh_key     = ""
ext_reset_ssh   = ""
ext_remove_user = ""
ext_expiration  = ""
