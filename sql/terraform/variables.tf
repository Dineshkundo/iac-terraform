variable "subscription_id" {}
variable "tenant_id" {}

variable "resource_group_name" {}
variable "location" {}

variable "server_name" {}
variable "administrator_login" {}
variable "administrator_login_password" { sensitive = true }

variable "public_network_access_enabled" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}

# VNet rule
#####################################################
# Optional VNet Rule
#####################################################
variable "vnet_rule_enabled" {
  type    = bool
  default = false
}

variable "vnet_rule_name" {
  type    = string
  default = ""
}

variable "virtual_network_subnet_id" {
  type    = string
  default = ""

  validation {
    condition = (
      (var.vnet_rule_enabled && var.vnet_rule_name != "" && var.virtual_network_subnet_id != "") ||
      (!var.vnet_rule_enabled && var.vnet_rule_name == "" && var.virtual_network_subnet_id == "")
    )
    error_message = "If vnet_rule_enabled=true, you must set vnet_rule_name and virtual_network_subnet_id. If false, both must be empty."
  }
}
# DBs
variable "db_names" {
  type = map(string)
}

variable "db_sku_map" {
  type    = map(string)
  default = {}
}

variable "db_read_scale_map" {
  type    = map(bool)
  default = {}
}

variable "db_zone_redundant_map" {
  type    = map(bool)
  default = {}
}

variable "db_read_replica_count_map" {
  type    = map(number)
  default = {}
}

variable "db_tags" {
  type    = map(map(string))
  default = {}
}

variable "default_db_sku" {
  type    = string
  default = "Standard"
}


# Private Endpoints
variable "pe_names" {
  type    = map(string)
  default = {}
}
variable "pe_tags" {
  type    = map(map(string))
  default = {}
}
variable "pe_subresources" {
  type    = map(list(string))
  default = {}
}


variable "private_endpoint_subnet_id" {
  type    = string
  default = ""
}
variable "private_endpoint_resource_group" {
  type = string
}
variable "pec_ids" {
  type    = map(string)
  default = {}
}

variable "tde_state" {
  type    = string
  default = "Enabled"
}
variable "private_dns_zone_ids" {
  type    = list(string)
  default = []
}

