data "azurerm_network_interface" "nic" {
  name                = local.nic_name
  resource_group_name = local.nic_rg
}

data "azurerm_managed_disk" "os_disk" {
  name                = local.os_disk_name
  resource_group_name = local.os_disk_rg
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

