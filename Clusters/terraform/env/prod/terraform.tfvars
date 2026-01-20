subscription_id = "072f61b4-efbf-4a3a-9f78-9ce578e1c75d"
tenant_id       = "2eb52881-f5b4-4855-9142-cd907aa33267"

aks_name = "CODA-PROD-AKS-Cluster"
resource_group_name = "CODA-PROD-RG"
location = "eastus"

dns_prefix         = "CODA-PROD-AKS-Cluster-dns"
kubernetes_version = "1.31.1"

vnet_id = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/CODA-PROD-RG/providers/Microsoft.Network/virtualNetworks/CODA-Prod-VNet"
subnet_name = "CODA-PROD-Private-Subnet"

log_analytics_workspace_id = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/DefaultResourceGroup-EUS/providers/Microsoft.OperationalInsights/workspaces/CODA-PROD-LogAnalytics"
defender_workspace_id      = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/DefaultResourceGroup-EUS/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-072f61b4-efbf-4a3a-9f78-9ce578e1c75d-EUS"

kubelet_identity_id = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/MC_CODA-PROD-RG_CODA-PROD-AKS-Cluster_eastus/providers/Microsoft.ManagedIdentity/userAssignedIdentities/CODA-PROD-AKS-Cluster-agentpool"

network_profile = {
  network_plugin    = "azure"
  network_policy    = "calico"
  load_balancer_sku = "standard"
  dns_service_ip    = "10.0.0.10"
  service_cidr      = "10.0.0.0/16"
  outbound_type     = "loadBalancer"
}

oms_agent = {
  log_analytics_workspace_id = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/DefaultResourceGroup-EUS/providers/Microsoft.OperationalInsights/workspaces/CODA-PROD-LogAnalytics"
}

authorized_ips = [
  "10.1.4.5/32",
  "38.79.64.66/32",
  "13.82.177.68/32"
]

agent_pools = {
  prodnodepool = {
    vm_size              = "Standard_D8s_v3"
    count                = 2
    min_count            = 1
    max_count            = 5
    max_pods             = 50
    os_disk_size_gb      = 128
    os_sku               = "Ubuntu"
    os_type              = "Linux"
    orchestrator_version = "1.30.9"
    mode                 = "System"
    node_labels          = {}
    node_taints          = []
    subnet_id            = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/CODA-PROD-RG/providers/Microsoft.Network/virtualNetworks/CODA-Prod-VNet/subnets/CODA-PROD-Private-Subnet"
  }

  cacheservice = {
    vm_size              = "Standard_D8s_v3"
    count                = 0
    min_count            = 0
    max_count            = 0
    max_pods             = 250
    os_disk_size_gb      = 200
    os_sku               = "Ubuntu"
    os_type              = "Linux"
    orchestrator_version = "1.30.9"
    mode                 = "User"
    node_labels          = { pool = "cacheservice" }
    node_taints          = ["app=cacheservice:NoSchedule"]
    subnet_id            = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/CODA-PROD-RG/providers/Microsoft.Network/virtualNetworks/CODA-Prod-VNet/subnets/CODA-PROD-Private-Subnet"
  }

  codaprodpool = {
    vm_size              = "Standard_D16s_v3"
    count                = 0
    min_count            = 0
    max_count            = 0
    max_pods             = 250
    os_disk_size_gb      = 400
    os_sku               = "Ubuntu"
    os_type              = "Linux"
    orchestrator_version = "1.30.9"
    mode                 = "User"
    node_labels          = { pool = "D-series" }
    node_taints          = ["app=coda-service:NoSchedule"]
    subnet_id            = "/subscriptions/072f61b4-efbf-4a3a-9f78-9ce578e1c75d/resourceGroups/CODA-PROD-RG/providers/Microsoft.Network/virtualNetworks/CODA-Prod-VNet/subnets/CODA-PROD-Private-Subnet"
  }
}

tags = {
  "CODA-PROD" = "AKS"
}

