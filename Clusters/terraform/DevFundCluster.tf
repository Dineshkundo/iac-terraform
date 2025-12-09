resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_name

  kubernetes_version = values(var.agent_pools)[0].orchestrator_version

  identity {
    type = "SystemAssigned"
  }
  
  default_node_pool {
    name                = "linuxpool"
    vm_size             = var.agent_pools["linuxpool"].vm_size
    node_count          = var.agent_pools["linuxpool"].count
    min_count           = var.agent_pools["linuxpool"].min_count
    max_count           = var.agent_pools["linuxpool"].max_count

    vnet_subnet_id = var.agent_pools["linuxpool"].subnet_id
    max_pods       = var.agent_pools["linuxpool"].max_pods
    os_disk_size_gb = var.agent_pools["linuxpool"].os_disk_size_gb
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

    # 🚫 Tell Terraform: "Do NOT try to change any of this stuff."
    ignore_changes = [
      # 🔑 the LAST remaining drift sources
      node_os_upgrade_channel,
      azure_active_directory_role_based_access_control,
      
      # top-level flags
      azure_policy_enabled,
      cost_analysis_enabled,
      http_application_routing_enabled,
      local_account_disabled,
      open_service_mesh_enabled,
      tags,

      # whole blocks we don't want to touch
      default_node_pool,
      auto_scaler_profile,
      linux_profile,
      windows_profile,
      microsoft_defender,
      monitor_metrics,
      network_profile,
      oms_agent,
      kubelet_identity,
    ]
  }
}

