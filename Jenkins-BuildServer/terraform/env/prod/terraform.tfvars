resource_group_name = "CODA-PROD-RG"
location            = "eastus"

subscription_id = "072f61b4-efbf-4a3a-9f78-9ce578e1c75d"
tenant_id       = "2eb52881-f5b4-4855-9142-cd907aa33267"

vm_name = "CODA-PROD-Jenkins"
vm_size = "Standard_D4s_v3"
zone    = "2"

# === REQUIRED VARIABLES FOR DS LOOKUP ===
nic_name     = "coda-prod-jenkins686_z2"
os_disk_name = "CODA-PROD-Jenkins_OsDisk_1_64b95c0bd327434e9661efcdfdab9702"

# No data disk
data_disk_id = ""

admin_username = "jenkinsadmin"

# These come automatically from data.azurerm_managed_disk.os_disk
# so we REMOVE all os_disk_* variables from tfvars:
#   os_disk_caching
#   os_disk_storage_account_type
#   os_disk_size_gb

# Image reference
image_publisher = "canonical"
image_offer     = "0001-com-ubuntu-server-jammy"
image_sku       = "22_04-lts-gen2"
image_version   = "latest"

# SSH public key
# ssh_key_path = "/home/jenkinsadmin/.ssh/authorized_keys"

tags = {
  environment = "prod"
  service     = "jenkins"
}

