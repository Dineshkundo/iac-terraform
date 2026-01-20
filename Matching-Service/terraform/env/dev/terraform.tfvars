resource_group_name = "CODA_RG"
location            = "eastus"
subscription_id     = "d629b553-466f-4caa-b64b-9ba2bae97c3f"
tenant_id           = "2eb52881-f5b4-4855-9142-cd907aa33267"
vm_name = "Matching-Service"
vm_size = "Standard_D32s_v3"
zone    = "1"

nic_name     = "matching-service427_z1"
os_disk_name = "Matching-Service_OsDisk_1_40d9cccfdfa64c8593c649e7a01e9704"

admin_username = "matching-admin"

os_disk_caching              = "ReadWrite"
os_disk_storage_account_type = "Premium_LRS"
os_disk_size_gb              = 64

image_publisher = "canonical"
image_offer     = "0001-com-ubuntu-server-jammy"
image_sku       = "22_04-lts-gen2"
image_version   = "latest"

tags = {
  service = "matching-engine"
}
