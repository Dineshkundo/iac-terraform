resource_group_name = "CODA-PROD-RG"
location            = "eastus"

subscription_id = "072f61b4-efbf-4a3a-9f78-9ce578e1c75d"
tenant_id       = "2eb52881-f5b4-4855-9142-cd907aa33267"

vm_name = "RHEL-PROD-KAFKA"
vm_size = "Standard_D2s_v3"

nic_id = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/CODA-PROD-RG/providers/Microsoft.Network/networkInterfaces/rhel-prod-kafka127_z2"

os_disk_id = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/CODA-PROD-RG/providers/Microsoft.Compute/disks/RHEL-PROD-KAFKA_OsDisk_1_385c541ca3e042c99562a5c075eafb7f"

data_disk_id = ""   # none

admin_username = "kafkaadmin"

image_publisher = "RedHat"
image_offer     = "RHEL"
image_sku       = "95_gen2"
image_version   = "latest"

tags = {
  service = "kafka"
}

