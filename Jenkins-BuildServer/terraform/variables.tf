variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "vm_name" { type = string }
variable "vm_size" { type = string }
variable "zone"    { type = string }

# NIC & Disk names only (no long ARM IDs)
variable "nic_name"       { type = string }
variable "os_disk_name"   { type = string }

# SSH public key file path (not the key)
variable "ssh_key_path"   { type = string }
variable "admin_username" { type = string }

# OS Disk settings
variable "os_disk_caching"              { type = string }
variable "os_disk_storage_account_type" { type = string }
variable "os_disk_size_gb"              { type = number }

# Image reference
variable "image_publisher" { type = string }
variable "image_offer"     { type = string }
variable "image_sku"       { type = string }
variable "image_version"   { type = string }

variable "tags" {
  type    = map(string)
  default = {}
}

