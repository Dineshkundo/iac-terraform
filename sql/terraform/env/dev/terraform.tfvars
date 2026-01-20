# azure tenant/sub
subscription_id = "d629b553-466f-4caa-b64b-9ba2bae97c3f"
tenant_id       = "2eb52881-f5b4-4855-9142-cd907aa33267"

resource_group_name = "CODA_RG"
location = "eastus"

# server
server_name = "test-coda"
administrator_login = "sqladmin"
# leave password blank if you don't want to manage it (we will ignore changes to password)
administrator_login_password = ""

# make tags match existing state exactly (so TF won't modify)
tags = {
  test = "coda"
}

public_network_access_enabled = true

# vnet rule
### DEV HAS A VNET RULE
vnet_rule_enabled       = true
vnet_rule_name = "newVnetRule1"
virtual_network_subnet_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/virtualNetworks/DevVnet/subnets/Subnet1"

# DB name map (matches state)
db_names = {
  coda_migration = "CODA_MIGRATION"
  coda_2024      = "CODA-2024-5-8-12-4-DEV"
  ssisdb         = "SSISDB"
}

# SKUs exactly as seen in state (important)
db_sku_map = {
  coda_migration = "HS_Gen5_2"
  coda_2024      = "HS_MOPRMS_4"
  ssisdb         = "S1"
}

# read_scale must be boolean to match state
db_read_scale_map = {
  coda_migration = true
  coda_2024      = false
  ssisdb         = false
}

# read_replica_count (as in state)
db_read_replica_count_map = {
  coda_migration = 1
  coda_2024      = 0
  ssisdb         = 0
}

# zone_redundant as in state
db_zone_redundant_map = {
  coda_migration = false
  coda_2024      = false
  ssisdb         = false
}

db_tags = {}

default_db_sku = "Standard"


# Private endpoints — names must match state
pe_names = {
  dev_db    = "dev-db-private-endpoint"
  test_coda = "test-coda"
}
pe_subresources = {
  dev_db    = ["sqlServer"]
  test_coda = ["SqlServer"]
}
# Private endpoints live in CODA_RG, Subnet1
private_endpoint_resource_group = "CODA_RG"
private_endpoint_subnet_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/virtualNetworks/DevVnet/subnets/Subnet1"

private_dns_zone_ids = [
  "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/privateDnsZones/privatelink.database.windows.net"
]

pe_tags = {
  dev_db = {
    "dev-db" = "private-endpoint"
  },
  test_coda = {}
}
