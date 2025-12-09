resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size

  admin_username                  = var.admin_username
  disable_password_authentication = false  # ARM setting

  network_interface_ids = [
    data.azurerm_network_interface.nic.id
  ]

  os_disk {
    name                 = data.azurerm_managed_disk.os_disk.name
    caching              = "ReadWrite"
    storage_account_type = data.azurerm_managed_disk.data_disk1.storage_account_type
    disk_size_gb         = var.data_disk_size_gb
   }

  source_image_reference {
    publisher = var.image_publisher     # RedHat
    offer     = var.image_offer         # RHEL
    sku       = var.image_sku           # 7lvm-gen2
    version   = var.image_version       # latest
  }

  identity {
    type = "SystemAssigned"
  }


  boot_diagnostics {
    storage_account_uri = null
  }

lifecycle {
  prevent_destroy = true

  ignore_changes = [
    # OS & image (never touch imported VM identity)
    os_disk,
    source_image_reference,
  # Host encryption – already configured in Azure, don't touch
    encryption_at_host_enabled,
    # Patch & agent behavior (Azure-managed)
    patch_assessment_mode,
    patch_mode,
    provision_vm_agent,
    allow_extension_operations,

    # Identity (Azure-generated)
    identity,

    # Passwords (Azure blocks diffs)
    admin_password,
  ]
}

  tags = var.tags
}

