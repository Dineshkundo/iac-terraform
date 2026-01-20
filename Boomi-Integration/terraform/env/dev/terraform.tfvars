subscription_id     = "d629b553-466f-4caa-b64b-9ba2bae97c3f"
tenant_id           = "2eb52881-f5b4-4855-9142-cd907aa33267"

resource_group_name = "CODA_RG"
location            = "eastus"

vm_name = "Boomi-Integration"
vm_size = "Standard_D2s_v3"
zone    = "1"

nic_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/networkInterfaces/boomi-integration714_z1"

os_disk_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Compute/disks/Boomi-Integration_OsDisk_1_e0ba1daa07f4449684689975190e303a"


tags = {
  Bhoomi = "Integraion server"
}
