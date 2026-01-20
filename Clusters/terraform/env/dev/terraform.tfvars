resource_group_name  = "CODA_RG"
storage_account_name = "codadevsa"
container_name       = "tfstate"

key = "CODA_RG/nonprd/dev/Clusters/DevFundCluster/dev.DevFundCluster.tfstate"

subscription_id = "d629b553-466f-4caa-b64b-9ba2bae97c3f"
tenant_id       = "2eb52881-f5b4-4855-9142-cd907aa33267"   # Fill your Azure AD tenant

aks_name            = "DevFundCluster"
location            = "eastus"
resource_group_name = "CODA_RG"

# From ARM: servicePrincipalProfile.clientId = "msi"
service_principal = {
  client_id = "msi"
}

azure_policy_enabled = true

oms_agent = {
  log_analytics_workspace_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/defaultresourcegroup-eus/providers/Microsoft.OperationalInsights/workspaces/defaultworkspace-d629b553-466f-4caa-b64b-9ba2bae97c3f-eus"
}

network_profile = {
  network_plugin    = "azure"
  network_policy    = "azure"
  load_balancer_sku = "standard"
  dns_service_ip    = "10.30.1.10"
  service_cidr      = "10.30.1.0/24"
  outbound_type     = "loadBalancer"
}

aad_profile = {
  managed         = true
  tenant_id       = "2eb52881-f5b4-4855-9142-cd907aa33267"
  admin_group_ids = []
}

identity_profile = {
  kubelet_identity_id = null
}


authorized_ips = [
  "38.79.64.66/32",
  "172.208.97.243/32"
]

#
# IMPORTANT — VNET IDs from your ARM Template
#
# virtualNetworks_DevVnet_externalid
#   = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/virtualNetworks/DevVnet"
#
# Subnets referenced:
#   Subnet2
#   subnet3
#

agent_pools = {
  linuxpool = {
    vm_size              = "Standard_B4ms"
    count                = 2
    min_count            = 1
    max_count            = 5
    max_pods             = 50
    os_disk_size_gb      = 30
    os_sku               = "Ubuntu"
    os_type              = "Linux"
    orchestrator_version = "1.27.3"
    mode                 = "System"
    node_labels          = {}
    node_taints          = []

    subnet_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/virtualNetworks/DevVnet/subnets/Subnet2"
  }

  codadevpool = {
    vm_size              = "Standard_D16s_v3"
    count                = 2
    min_count            = 1
    max_count            = 2
    max_pods             = 30
    os_disk_size_gb      = 128
    os_sku               = "Ubuntu"
    os_type              = "Linux"
    orchestrator_version = "1.27.3"
    mode                 = "User"
    node_labels          = { pool = "D-series" }
    node_taints          = ["app=coda-service:NoSchedule"]

    subnet_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/virtualNetworks/DevVnet/subnets/subnet3"
  }

  cacheservice = {
    vm_size              = "Standard_D8s_v3"
    count                = 1
    min_count            = 1
    max_count            = 2
    max_pods             = 30
    os_disk_size_gb      = 100
    os_sku               = "Ubuntu"
    os_type              = "Linux"
    orchestrator_version = "1.27.3"
    mode                 = "User"
    node_labels          = { pool = "cacheservice" }
    node_taints          = ["app=cacheservice:NoSchedule"]

    subnet_id = "/subscriptions/d629b553-466f-4caa-b64b-9ba2bae97c3f/resourceGroups/CODA_RG/providers/Microsoft.Network/virtualNetworks/DevVnet/subnets/subnet3"
  }
}
