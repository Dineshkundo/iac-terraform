resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  zone                = var.zone

  admin_username = var.admin_username

  network_interface_ids = [
    data.azurerm_network_interface.nic.id
  ]

  disable_password_authentication = true

  # admin_ssh_key {
  #   username   = var.admin_username
  #   public_key = data.local_file.ssh_key.content
  # }

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

  secure_boot_enabled  = true
  vtpm_enabled         = true

  boot_diagnostics {
    storage_account_uri = null
  }

  lifecycle {
    ignore_changes = all
  }

  tags = var.tags
}

