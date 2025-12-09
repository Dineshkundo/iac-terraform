resource "azurerm_storage_encryption_scope" "scopes" {
  for_each = local.scopes

  name               = each.key
  storage_account_id = azurerm_storage_account.this.id
  source             = each.value.source
}

