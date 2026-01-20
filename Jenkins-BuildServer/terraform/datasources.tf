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

# Optional – if no data disk leave this
data "azurerm_managed_disk" "data_disk1" {
  count               = var.data_disk_id == "" ? 0 : 1
  name                = element(split("/", var.data_disk_id), 8)
  resource_group_name = element(split("/", var.data_disk_id), 4)
}

