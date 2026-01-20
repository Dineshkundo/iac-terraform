subscription_id     = "d629b553-466f-4caa-b64b-9ba2bae97c3f"
tenant_id           = "2eb52881-f5b4-4855-9142-cd907aa33267"

resource_group_name = "CODA_RG"
location            = "eastus"

vm_name = "Matching-Service-QA-Backup"
vm_zone = "1"
vm_size = "Standard_D8s_v3"

tags = {
  matching = "qa-backup"
}

nic_id    = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/networkInterfaces/matching-service-qa-backup123_z1"
os_disk_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Compute/disks/matching-qa-backup-1"

admin_username        = "adminuser"

image_publisher = "canonical"
image_offer     = "0001-com-ubuntu-server-jammy"
image_sku       = "22_04-lts-gen2"
image_version   = "latest"

ext_username    = "adminuser"
