variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subscription_id" { type = string }

variable "tenant_id"       { type = string }

variable "storage_account_name" {
  type = string
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "replication_type" {
  type    = string
  default = "LRS"
}

variable "account_kind" {
  type    = string
  default = "StorageV2"
}

variable "min_tls_version" {
  type    = string
}

variable "allow_blob_public_access" {
  type = bool
}

variable "allow_shared_key_access" {
  type = bool
}

variable "large_file_shares_enabled" {
  type = bool
}

variable "https_only" {
  type = bool
}

variable "public_network_access_enabled" {
  type = bool
}

variable "access_tier" {
  type = string
}



# Network ACL rules
variable "default_network_action" {
  type = string
}

variable "allowed_ip_rules" {
  type = list(string)
}

variable "virtual_network_subnet_ids" {
  type = list(string)
}

variable "resource_access_rules" {
  type = list(object({
    tenant_id   = string
    resource_id = string
  }))
}

# Blob retention
variable "container_delete_retention_days" {
  type = number
}

variable "blob_delete_retention_days" {
  type = number
}

# File share retention
variable "file_share_delete_retention_days" {
  type = number
}

# Containers
variable "blob_containers" {
  type = list(string)
}

# File shares
variable "file_shares" {
  type = list(object({
    name        = string
    quota       = number
    access_tier = string
  }))
}

# Encryption scope
variable "encryption_scopes" {
  type = list(object({
    name   = string
    source = string
  }))
}

variable "tags" {
  type = map(string)
}

