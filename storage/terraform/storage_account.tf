resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location

  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  min_tls_version                = var.min_tls_version
  public_network_access_enabled  = var.public_network_access_enabled
  large_file_share_enabled       = var.large_file_shares_enabled
  https_traffic_only_enabled     = var.https_only
  allow_nested_items_to_be_public = var.allow_blob_public_access
  shared_access_key_enabled      = var.allow_shared_key_access
  access_tier                    = var.access_tier

  identity {
    type = "SystemAssigned"
  }

  network_rules {
    default_action             = var.default_network_action
    ip_rules                   = local.ip_rules
    virtual_network_subnet_ids = local.subnets
    bypass                     = ["AzureServices", "Logging", "Metrics"]
  }

  blob_properties {
    delete_retention_policy {
      days = var.blob_delete_retention_days
    }

    container_delete_retention_policy {
      days = var.container_delete_retention_days
    }
  }

  share_properties {
    retention_policy {
      days = var.file_share_delete_retention_days
    }
  }

  tags = local.tags
}

