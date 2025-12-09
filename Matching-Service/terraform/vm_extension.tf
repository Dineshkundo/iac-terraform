resource "azurerm_virtual_machine_extension" "enablevmaccess" {
  name                 = "enablevmAccess"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id

  publisher            = "Microsoft.OSTCExtensions"
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"
  automatic_upgrade_enabled = true

  settings = jsonencode({})

  protected_settings = jsonencode({
    username    = var.admin_username
    ssh_key     = ""
    reset_ssh   = "false"
    remove_user = "false"
    expiration  = "9999-12-31T23:59:59Z"
  })

  lifecycle {
    ignore_changes = all
  }
}

