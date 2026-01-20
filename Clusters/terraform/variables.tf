variable "aks_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "subscription_id" { type = string }
variable "tenant_id" { type = string }

variable "vnet_id" { type = string }
variable "subnet_name" { type = string }
variable "log_analytics_workspace_id" { type = string }
variable "defender_workspace_id" { type = string }
variable "kubelet_identity_id" { type = string }
variable "dns_prefix" { type = string }
variable "kubernetes_version" { type = string }
variable "tags" {
  type = map(string)
}
# -----------------------
#  NETWORK PROFILE
# -----------------------
variable "network_profile" {
  type = object({
    network_plugin    = string
    network_policy    = string
    load_balancer_sku = string
    dns_service_ip    = string
    service_cidr      = string
    outbound_type     = string
  })
  default = {
    network_plugin    = ""
    network_policy    = ""
    load_balancer_sku = ""
    dns_service_ip    = ""
    service_cidr      = ""
    outbound_type     = ""
  }
}

variable "azure_policy_enabled" {
  type    = bool
  default = false
}

# -----------------------
# OMS Agent Profile
# -----------------------
variable "oms_agent" {
  type = object({
    log_analytics_workspace_id = string
  })
  default = {
    log_analytics_workspace_id = ""
  }
}

# -----------------------
# Service Principal
# -----------------------
variable "service_principal" {
  type = object({
    client_id = string
  })
  default = {
    client_id = ""
  }
}

# -----------------------
# Authorized IPs
# -----------------------
variable "authorized_ips" {
  type    = list(string)
  default = []
}

# -----------------------
# Agent Pools
# -----------------------
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
  default = {}
}

# -----------------------
# AAD Profile
# -----------------------
variable "aad_profile" {
  type = object({
    tenant_id       = string
    admin_group_ids = list(string)
    managed         = bool
  })
  default = {
    tenant_id       = ""
    admin_group_ids = []
    managed         = false
  }
}

# -----------------------
# Identity Profile
# -----------------------
variable "identity_profile" {
  type = object({
    kubelet_identity_id = string
  })
  default = {
    kubelet_identity_id = ""
  }
}

