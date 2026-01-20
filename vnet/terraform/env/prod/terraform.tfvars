subscription_id     = "072f61b4-efbf-4a3a-9f78-9ce578e1c75d"
tenant_id           = "2eb52881-f5b4-4855-9142-cd907aa33267"
resource_group_name = "CODA-PROD-RG"

vnet_name     = "CODA-Prod-VNet"
location      = "eastus"
address_space = ["10.1.0.0/16"]

subnets = {
  GatewaySubnet = {
    address_prefixes  = ["10.1.0.0/24"]
    service_endpoints = ["Microsoft.Storage"]
  }

  AzureFirewallSubnet = {
    address_prefixes  = ["10.1.1.0/26"]
    service_endpoints = ["Microsoft.Storage"]
  }

  CODA-PROD-Private-Subnet = {
    address_prefixes  = ["10.1.4.0/22"]
    service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]
    nsg_name          = "CODA-PROD-Private-Subnet-NSG"
    route_table_name  = "AKS-PROD-TO-ONPREMISE"
  }
}

nsgs = {
  CODA-PROD-Private-Subnet-NSG = "CODA-PROD-Private-Subnet-NSG"
}

route_tables = {
  AKS-PROD-TO-ONPREMISE = "AKS-PROD-TO-ONPREMISE"
}

