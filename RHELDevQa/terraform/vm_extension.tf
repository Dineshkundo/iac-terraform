resource "azurerm_virtual_machine_extension" "enablevmaccess" {
  name               = "enablevmAccess"
  virtual_machine_id = azurerm_linux_virtual_machine.vm.id

  publisher            = "Microsoft.OSTCExtensions"
  type                 = "VMAccessForLinux"
  type_handler_version = "1.5"

  auto_upgrade_minor_version = true

  settings = jsonencode({})

  protected_settings = jsonencode({
    username    = var.ext_username
    password    = var.ext_password
    ssh_key     = var.ext_ssh_key
    reset_ssh   = var.ext_reset_ssh
    remove_user = var.ext_remove_user
    expiration  = var.ext_expiration
  })

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [
      settings,
      protected_settings,
      tags
    ]
  }
}

