resource "azurerm_storage_container" "containers" {
  for_each = local.containers

  name                  = each.key
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

