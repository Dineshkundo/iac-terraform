resource "azurerm_storage_share" "shares" {
  for_each = local.shares

  name                 = each.key
  quota                = each.value.quota
  access_tier          = each.value.access_tier
  storage_account_name = azurerm_storage_account.this.name
}

