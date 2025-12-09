variable "aks_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "subscription_id" { type = string }

variable "tenant_id"       { type = string }
# network profile
variable "network_profile" {
  type = object({
    network_plugin    = string
    network_policy    = string
    load_balancer_sku = string
    dns_service_ip    = string
    service_cidr      = string
    outbound_type     = string
  })
}

variable "azure_policy_enabled" {
  type = bool
}

variable "oms_agent" {
  type = object({
    log_analytics_workspace_id = string
  })
}

variable "service_principal" {
  type = object({
    client_id = string
  })
}

variable "authorized_ips" {
  type = list(string)
}

variable "agent_pools" {
  type = map(object({
    vm_size              = string
    count                = number
    min_count            = number
    max_count            = number
    max_pods             = number
    os_disk_size_gb      = number
    os_sku               = string
    os_type              = string
    orchestrator_version = string
    mode                 = string
    node_labels          = map(string)
    node_taints          = list(string)
    subnet_id            = string
  }))
}
variable "aad_profile" {
  type = object({
    tenant_id       = string
    admin_group_ids = list(string)
    managed         = bool
  })
}

variable "identity_profile" {
  type = object({
    kubelet_identity_id = string
  })
}

