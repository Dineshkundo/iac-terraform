# -------------------------
# Core
# -------------------------
subscription_id      = "072f61b4-efbf-4a3a-9f78-9ce578e1c75d"
tenant_id            = "2eb52881-f5b4-4855-9142-cd907aa33267"

resource_group_name  = "CODA-PROD-RG"
location             = "eastus"
storage_account_name = "codaprodsa"

# -------------------------
# Storage Account
# -------------------------
account_kind             = "StorageV2"
account_tier             = "Standard"
replication_type         = "LRS"
access_tier              = "Hot"

min_tls_version               = "TLS1_2"
public_network_access_enabled = true
large_file_shares_enabled     = true
https_only                    = true
allow_blob_public_access      = false
allow_shared_key_access       = true

# -------------------------
# Network Rules
# -------------------------
default_network_action = "Deny"

allowed_ip_rules = [
  "38.79.64.66"
]

virtual_network_subnet_ids = [
  "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/CODA-PROD-RG/providers/Microsoft.Network/virtualNetworks/CODA-Prod-VNet/subnets/CODA-PROD-Private-Subnet",
  "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/CODA-PROD-RG/providers/Microsoft.Network/virtualNetworks/CODA-Prod-VNet/subnets/AzureFirewallSubnet",
  "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/CODA-PROD-RG/providers/Microsoft.Network/virtualNetworks/CODA-Prod-VNet/subnets/GatewaySubnet"
]

# -------------------------
# Resource Access Rules
# -------------------------
resource_access_rules = [
  {
    tenant_id   = "2eb52881-f5b4-4855-9142-cd907aa33267"
    resource_id = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/providers/Microsoft.Security/datascanners/storageDataScanner"
  }
]

# -------------------------
# Blob & Container Retention
# -------------------------
blob_delete_retention_days      = 7
container_delete_retention_days = 7
file_share_delete_retention_days = 7

# -------------------------
# Blob Containers
# -------------------------
blob_containers = [
  "acr-images",
  "akslogs",
  "bootdiagnostics-rhelprodk-a2b57021-bbd5-469a-924e-50ae1e15792f",
  "bootdiagnostics-rhelprodk-e2c8a997-527a-4ae9-bacf-2c3ae75db717",
  "codaprod",
  "jenkins-backup",
  "loki",
  "sql-backup",
  "sqldbauditlogs",
  "tfstate",
  "trivy-reports"
]

# -------------------------
# File Shares
# (ARM template did not define explicit shares)
# -------------------------
file_shares = []

# -------------------------
# Encryption Scopes
# (ARM used default account encryption only)
# -------------------------
encryption_scopes = []

# -------------------------
# Tags
# -------------------------
tags = {
  Environment = "PROD"
  ManagedBy   = "Terraform"
  Source      = "ARM-Import"
}

