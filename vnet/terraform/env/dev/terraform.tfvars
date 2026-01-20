resource_group_name = "CODA_RG"
subscription_id     = "d629b553-466f-4caa-b64b-9ba2bae97c3f"
tenant_id           = "2eb52881-f5b4-4855-9142-cd907aa33267"

vnet_name           = "DevVnet"
location            = "eastus"
address_space       = ["10.0.0.0/16"]

subnets = {
  GatewaySubnet = {
    address_prefixes   = ["10.0.6.0/24"]
    service_endpoints  = ["Microsoft.KeyVault", "Microsoft.Storage"]
   }
  AzureFirewallManagementSubnet = {
    address_prefixes   = ["10.0.3.0/24"]
    service_endpoints  = ["Microsoft.KeyVault", "Microsoft.Storage"]
  }


  AzureFirewallSubnet = {
    address_prefixes   = ["10.0.4.0/24"]
    service_endpoints  = ["Microsoft.KeyVault", "Microsoft.Storage"]
  }

  Subnet1 = {
    address_prefixes   = ["10.0.1.0/24"]
    service_endpoints  = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql"]
    nsg_name           = "NSGPublicSubnet"
  }

  Subnet2 = {
    address_prefixes   = ["10.0.2.0/24"]
    service_endpoints  = ["Microsoft.Storage", "Microsoft.KeyVault"]
    nsg_name           = "NSGPrivateSubnet"
    route_table_name   = "AKStoOnpremises"
  }

  subnet3 = {
    address_prefixes   = ["10.0.8.0/22"]
    service_endpoints  = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql"]
    nsg_name           = "NSGPrivateSubnet"
    route_table_name   = "AKStoOnpremises"
  }

  Subnet4 = {
    address_prefixes = ["10.0.20.0/24"]
    nsg_name         = "NSGPrivateSubnet"
    route_table_name = "AKStoOnpremises"

    delegations = [
      {
        name         = "dnsResolvers"
        service_name = "Microsoft.Network/dnsResolvers"
      }
    ]
  }
}

nsgs = {
  NSGPublicSubnet        = "NSGPublicSubnet"
  NSGPrivateSubnet       = "NSGPrivateSubnet"
  Boomi-Integration-nsg  = "Boomi-Integration-nsg"
  jumphost-test-nsg      = "jumphost-test-nsg"
  Matching-Service-nsg   = "Matching-Service-nsg"
}

route_tables = {
  AKStoOnpremises = "AKStoOnpremises"
}
