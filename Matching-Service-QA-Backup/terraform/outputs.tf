output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}
output "nic_id" {
  value = data.azurerm_network_interface.nic.id
}

output "os_disk_id" {
  value = data.azurerm_managed_disk.os_disk.id
}

