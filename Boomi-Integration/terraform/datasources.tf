data "azurerm_network_interface" "nic" {
  name                = element(split("/", var.nic_id), 8)
  resource_group_name = element(split("/", var.nic_id), 4)
}

data "azurerm_managed_disk" "os_disk" {
  name                = element(split("/", var.os_disk_id), 8)
  resource_group_name = element(split("/", var.os_disk_id), 4)
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

