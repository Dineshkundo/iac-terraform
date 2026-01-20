#################################################################
# REQUIRED:
#################################################################
resource_group_name = "CODA_RG"      # <--- FILL THIS
location            = "eastus"       # from ARM template location
subscription_id     = "d629b553-466f-4caa-b64b-9ba2bae97c3f"
tenant_id           = "2eb52881-f5b4-4855-9142-cd907aa33267"

tags = {
  Environment = "dev"                # <--- you may modify/remove
}

#################################################################
# STORAGE ACCOUNT BASIC SETTINGS
#################################################################
storage_account_name = "codadevsa"

account_tier        = "Standard"
replication_type    = "LRS"
account_kind        = "StorageV2"

min_tls_version                 = "TLS1_2"
allow_blob_public_access        = false
allow_shared_key_access         = true
large_file_shares_enabled       = true
https_only                      = true
public_network_access_enabled   = true
access_tier                     = "Hot"

#################################################################
# ROUTING PREFERENCE
#################################################################
routing_choice                = "MicrosoftRouting"
publish_microsoft_endpoints  = false
publish_internet_endpoints   = false

#################################################################
# NETWORK ACLS
#################################################################
default_network_action = "Deny"

allowed_ip_rules = [
  "38.79.64.66",
]

virtual_network_subnet_ids = [
  "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/virtualNetworks/DevVnet/subnets/AzureFirewallManagementSubnet",
  "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/virtualNetworks/DevVnet/subnets/AzureFirewallSubnet",
  "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/virtualNetworks/DevVnet/subnets/GatewaySubnet",
  "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/virtualNetworks/DevVnet/subnets/Subnet1",
  "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/virtualNetworks/DevVnet/subnets/Subnet2",
]

resource_access_rules = [
  {
    tenant_id   = "2eb52881-f5b4-4855-9142-cd907aa33267"
    resource_id = "/subscriptions/d629b553----9ba2bae97c3f/resourceGroups/*/providers/Microsoft.DataFactory/factories/*"
  },
  {
    tenant_id   = "2eb52881-f5b4-4855-9142-cd907aa33267"
    resource_id = "/subscriptions/d629b553----b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.DataFactory/factories/CODADevDFtest"
  },
  {
    tenant_id   = "2eb52881-f5b4-4855-9142-cd907aa33267"
    resource_id = "/subscriptions/d629b553--9ba2bae97c3f/providers/Microsoft.Security/datascanners/StorageDataScanner"
  }
]

#################################################################
# BLOB & FILE RETENTION
#################################################################
container_delete_retention_days = 7
blob_delete_retention_days      = 7
file_share_delete_retention_days = 14

#################################################################
# BLOB CONTAINERS (ALL FROM ARM TEMPLATE)
#################################################################
blob_containers = [
  "akslogs",
  "bootdiagnostics-matchings-28686424-761a-440b-8ff0-05ccdf712989",
  "bootdiagnostics-securitys-6e2e677c-3ad2-4130-add2-66a20054370a",
  "codadev",
  "codadocumentuplods",
  "codafileattachments",
  "codaqa",
  "codaregistry-images",
  "codastoragedev",
  "codastorageuat",
  "codauat",
  "copyactivity-logs",
  "defectdojo",
  "devbacpac",
  "elasticsearch-backups-dev",
  "insights-logs-networksecuritygroupflowevent",
  "jenkins-backup",
  "sample",
  "sql-backup",
  "test",
  "tfstate",
  "trivy-reports",
  "vmguestdiagnostics-101ea038-bd2a-4a0c-8e97-d5a77d64ab6a",
  "vmguestdiagnostics-20264457-bedf-4af3-a420-1539ced89763",
  "vmguestdiagnostics-a250ece7-c078-487a-93d4-8a7377d99364",
  "vmguestdiagnostics-c5a0ebad-58b0-42f2-9e99-ecf78879f9c3"
]

#################################################################
# FILE SHARES (FROM ARM TEMPLATE)
#################################################################
file_shares = [
  {
    name        = "downloaded-claims"
    quota       = 102400
    access_tier = "TransactionOptimized"
  },
  {
    name        = "oc-payment-files"
    quota       = 102400
    access_tier = "TransactionOptimized"
  },
  {
    name        = "ssdtexecution"
    quota       = 102400
    access_tier = "TransactionOptimized"
  },
  {
    name        = "test-file-share"
    quota       = 102400
    access_tier = "TransactionOptimized"
  }
]

#################################################################
# ENCRYPTION SCOPES
#################################################################
encryption_scopes = [
  {
    name   = "test"
    source = "Microsoft.Storage"
  }
]
