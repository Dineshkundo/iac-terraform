subscription_id     = "d629b553-466f-4caa-b64b-9ba2bae97c3f"
tenant_id           = "2eb52881-f5b4-4855-9142-cd907aa33267"

resource_group_name = "CODA_RG"
location            = "eastus"

vm_name = "RHELDevQa"
vm_size = "Standard_B4ms"

nic_id       = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/networkInterfaces/rheldevqanic"
os_disk_id   = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Compute/disks/RHELDevQa_OsDisk_1_b60368dbdcda497f82ea176210a5a41d"
data_disk_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Compute/disks/RHELDevQa-datadisk1"

admin_username = "adminuser"

image_publisher = "RedHat"
image_offer     = "RHEL"
image_sku       = "7lvm-gen2"
image_version   = "latest"

tags = {
  Env = "DEV"
}
