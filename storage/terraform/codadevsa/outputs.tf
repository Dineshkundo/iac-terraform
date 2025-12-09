output "storage_account_id" {
  value = azurerm_storage_account.this.id
}

output "containers" {
  value = keys(azurerm_storage_container.containers)
}

output "file_shares" {
  value = keys(azurerm_storage_share.shares)
}

output "encryption_scopes" {
  value = keys(azurerm_storage_encryption_scope.scopes)
}

