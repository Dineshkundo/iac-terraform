resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  kubernetes_version = var.kubernetes_version

  sku_tier = "Standard"

  identity {
    type = "SystemAssigned"
  }
  
  default_node_pool {
    name                = "prodnodepool"
    vm_size             = var.agent_pools["prodnodepool"].vm_size
    node_count          = var.agent_pools["prodnodepool"].count
    min_count           = var.agent_pools["prodnodepool"].min_count
    max_count           = var.agent_pools["prodnodepool"].max_count

    vnet_subnet_id = var.agent_pools["prodnodepool"].subnet_id
    max_pods       = var.agent_pools["prodnodepool"].max_pods
    os_disk_size_gb = var.agent_pools["prodnodepool"].os_disk_size_gb
  }
  
  azure_active_directory_role_based_access_control {
    tenant_id = var.tenant_id
  }


  oms_agent {
    log_analytics_workspace_id = var.oms_agent.log_analytics_workspace_id
  }

  network_profile {
    network_plugin     = var.network_profile.network_plugin
    network_policy     = var.network_profile.network_policy
    load_balancer_sku  = var.network_profile.load_balancer_sku
    dns_service_ip     = var.network_profile.dns_service_ip
    service_cidr       = var.network_profile.service_cidr
    outbound_type      = var.network_profile.outbound_type
  }

  api_server_access_profile {
    authorized_ip_ranges = var.authorized_ips
  }

  oidc_issuer_enabled     = true
  workload_identity_enabled = true

lifecycle {
  prevent_destroy = true

  ignore_changes = [
    # Azure auto-managed identity rotation
    identity,

    # AAD / RBAC fields Azure mutates
    azure_active_directory_role_based_access_control,
    azure_policy_enabled,
    local_account_disabled,

    # Azure injects defaults into these
    http_application_routing_enabled,
    open_service_mesh_enabled,
    cost_analysis_enabled,
    kubernetes_version,
    node_os_upgrade_channel,

    # OS/Node pool drift
    default_node_pool,
    linux_profile,
    windows_profile,

    # OMS / Monitoring
    oms_agent,
    microsoft_defender,
    monitor_metrics,

    # Network drift fields Azure changes
    network_profile,
    network_profile[0].load_balancer_profile,
    network_profile[0].pod_cidrs,
    network_profile[0].service_cidrs,

    # Azure automatically injects these tags
    tags
  ]
 }

}

