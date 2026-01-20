resource_group_name = "CODA-PROD-RG"
location            = "eastus"

subscription_id = "072f61b4-efbf-4a3a-9f78-9ce578e1c75d"
tenant_id       = "2eb52881-f5b4-4855-9142-cd907aa33267"

# VM Details
vm_name = "MatchingService-PROD"
vm_size = "Standard_D2s_v3"
zone    = "2"

# NIC (from ARM template)
nic_name = "matchingservice-prod269_z2"

# OS Disk (from ARM template)
os_disk_name = "MatchingService-PROD_OsDisk_1_b34a3e075bd0495c81382ad5fdafdf80"

# Admin user
admin_username = "matchingadmin"

# OS Disk configuration
os_disk_caching              = "ReadWrite"
os_disk_storage_account_type = "Premium_LRS"
os_disk_size_gb              = 64   # You can adjust if needed

# Image Reference (copied exactly from ARM template)
image_publisher = "RedHat"
image_offer     = "RHEL"
image_sku       = "95_gen2"
image_version   = "latest"

# Tags
tags = {
  CODA-PROD = "Matching-service"
}

