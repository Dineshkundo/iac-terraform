data "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}

data "azurerm_managed_disk" "os_disk" {
  name                = var.os_disk_name
  resource_group_name = var.resource_group_name
}

data "local_file" "ssh_key" {
  filename = var.ssh_key_path
}

