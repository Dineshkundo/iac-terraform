resource_group_name = "CODA_RG"
location            = "eastus"
subscription_id     = "d629b553-466f-4caa-b64b-9ba2bae97c3f"
tenant_id           = "2eb52881-f5b4-4855-9142-cd907aa33267"

vm_name = "Jenkins-BuildServer"
vm_size = "Standard_D8s_v3"
zone    = "1"

admin_username = "jenkinsadmin"
ssh_key_path   = "/home/jenkinsadmin/.ssh/id_rsa.pub"

nic_name       = "jenkins-buildserver179_z1"
os_disk_name   = "Jenkins-BuildServer_OsDisk_1_a9a50a28855b4833ba4cddd13de11651"

os_disk_caching              = "ReadWrite"
os_disk_storage_account_type = "Premium_LRS"
os_disk_size_gb              = 128

image_publisher = "canonical"
image_offer     = "ubuntu-24_04-lts"
image_sku       = "server"
image_version   = "latest"

tags = {
  environment = "dev"
}