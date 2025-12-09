output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "kube_admin_config_raw" {
  value     = try(azurerm_kubernetes_cluster.aks.kube_admin_config_raw, "")
  sensitive = true
}

