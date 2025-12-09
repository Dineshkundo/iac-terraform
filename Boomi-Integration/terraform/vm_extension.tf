resource "azurerm_virtual_machine_extension" "enablevmaccess" {
  name               = "enablevmAccess"
  virtual_machine_id = azurerm_windows_virtual_machine.vm.id

  publisher            = "Microsoft.Compute"
  type                 = "VMAccessAgent"
  type_handler_version = "2.0"

  auto_upgrade_minor_version = true


  protected_settings = jsonencode({})
  lifecycle {
      ignore_changes = all
  
  }
}

