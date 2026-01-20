subscription_id = "072f61b4-efbf-4a3a-9f78-9ce578e1c75d"
tenant_id       = "2eb52881-f5b4-4855-9142-cd907aa33267"

resource_group_name = "CODA-PROD-RG"
location            = "eastus"

server_name                  = "coda-prod-sqldatabase-server"
administrator_login          = "sqadmin_prod"
administrator_login_password = ""    # ignored by lifecycle
public_network_access_enabled = true

tags = {
  CODA-PROD = "SQL"
}

db_names = {
  coda_prod = "CODA_Prod"
}

db_sku_map = {
  coda_prod = "HS_MOPRMS_6"   # Hyperscale 6 (matches ARM)
}

db_read_scale_map = {
  coda_prod = true
}

db_read_replica_count_map = {
  coda_prod = 1
}

db_zone_redundant_map = {
  coda_prod = false
}

db_tags = {
  coda_prod = {}
}

default_db_sku = "Standard"

pe_names = {
sql_pe = "CODA-PROD-testsql-privateendpoint"
}

private_endpoint_subnet_id      = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/CODA-PROD-RG/providers/Microsoft.Network/virtualNetworks/CODA-Prod-VNet/subnets/CODA-PROD-Private-Subnet"

private_endpoint_resource_group = "CODA-PROD-RG"
pec_ids                         = {}

private_dns_zone_ids = []
tde_state = "Enabled"

