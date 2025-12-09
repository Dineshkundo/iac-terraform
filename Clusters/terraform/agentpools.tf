resource "azurerm_kubernetes_cluster_node_pool" "pools" {
  for_each = {
    for k, v in var.agent_pools : k => v if k != "linuxpool"
  }

  name                  = each.key
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id

  vm_size              = each.value.vm_size
  node_count           = each.value.count
  min_count            = each.value.min_count
  max_count            = each.value.max_count

  vnet_subnet_id       = each.value.subnet_id
  max_pods             = each.value.max_pods
  os_disk_size_gb      = each.value.os_disk_size_gb

  os_sku               = each.value.os_sku
  os_type              = each.value.os_type
  orchestrator_version = each.value.orchestrator_version
  mode                 = each.value.mode

  node_labels = each.value.node_labels
  node_taints = each.value.node_taints

lifecycle {
  prevent_destroy = true
  ignore_changes = [
    os_disk_type,
    auto_scaling_enabled,
    upgrade_settings,
    tags,
  ]
}

}

