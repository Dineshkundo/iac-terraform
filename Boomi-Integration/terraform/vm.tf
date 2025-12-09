resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  size                = var.vm_size
  zone                = var.zone

  network_interface_ids = [
    data.azurerm_network_interface.nic.id
  ]

  # ✅ existing OS disk
  os_managed_disk_id = data.azurerm_managed_disk.os_disk.id

  # ✅ provider schema requirement (ONLY caching)
  os_disk {
    caching = "ReadWrite"
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      admin_username,
      admin_password,
      source_image_reference,
      source_image_id,
      identity,
      os_disk,
      zone,
      encryption_at_host_enabled,
    additional_capabilities,
    boot_diagnostics
    ]
  }
}

