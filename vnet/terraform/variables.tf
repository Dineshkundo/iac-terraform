
variable "resource_group_name" { type = string }

variable "subscription_id" { type = string }

variable "tenant_id" { type = string }


variable "vnet_name" { type = string }

variable "location" { type = string }

variable "address_space" {
  type        = list(string)
  description = "Address space to be used for the Virtual Network"

}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)

    # optional values, used ONLY if provided
    nsg_name         = optional(string)
    route_table_name = optional(string)

    service_endpoints = optional(list(string), [])
    delegations = optional(list(object({
      name         = string
      service_name = string
    })), [])
  }))
  description = "Dynamic subnet configuration for import or creation"
}

variable "nsgs" {
  type        = map(string)
  description = "Map of NSG names to resource groups"
}


variable "route_tables" {
  type        = map(string)
  description = "Map of route table names to resource groups"
}

