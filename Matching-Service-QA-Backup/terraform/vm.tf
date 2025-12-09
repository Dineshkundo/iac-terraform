resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  zone                = var.vm_zone

  admin_username                  = var.admin_username
  disable_password_authentication = true

  network_interface_ids = [
    data.azurerm_network_interface.nic.id
  ]

  os_disk {
    name                 = data.azurerm_managed_disk.os_disk.name
    caching              = "ReadWrite"
    storage_account_type = data.azurerm_managed_disk.os_disk.storage_account_type
    disk_size_gb         = data.azurerm_managed_disk.os_disk.disk_size_gb
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }


  identity {
    type = "SystemAssigned"
  }

  secure_boot_enabled = true
  vtpm_enabled        = true


  boot_diagnostics {
    storage_account_uri = null
  }
 lifecycle {
  prevent_destroy = true

  ignore_changes = [
    # OS disk (Azure-managed)
    os_disk,
 # 🔥 THE MOST IMPORTANT LINE
      admin_ssh_key,
    encryption_at_host_enabled,
    reboot_setting,
    additional_capabilities,
      admin_password,
    # Image (cannot change on existing VM)
    source_image_reference,
      identity
  ]
}
 
 tags = var.tags
}

