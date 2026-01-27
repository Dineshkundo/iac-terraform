resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size

  admin_username                  = var.admin_username
  disable_password_authentication = false  # from ARM

  network_interface_ids = [
    data.azurerm_network_interface.nic.id
  ]

  os_disk {
    name                 = data.azurerm_managed_disk.os_disk.name
    caching              = "ReadWrite"
    storage_account_type = data.azurerm_managed_disk.os_disk.storage_account_type
    disk_size_gb         = 64
  }

  source_image_reference {
    publisher = var.image_publisher   # RedHat
    offer     = var.image_offer       # RHEL
    sku       = var.image_sku         # 7lvm-gen2
    version   = var.image_version     # latest
  }

  identity {
    type = "SystemAssigned"
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }


  boot_diagnostics {
    storage_account_uri = null
  }

  tags = var.tags
}
