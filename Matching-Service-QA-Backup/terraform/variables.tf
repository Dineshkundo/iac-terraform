variable "subscription_id" { type = string }
variable "tenant_id"       { type = string }

variable "resource_group_name" { type = string }
variable "location"            { type = string }

variable "vm_name" { type = string }
variable "vm_zone" { type = string }
variable "vm_size" { type = string }

variable "tags" {
  type = map(string)
}

# Existing NIC ID
variable "nic_id" {
  type = string
}

# Existing OS Disk ID
variable "os_disk_id" {
  type = string
}

# SSH + OS profile variables
variable "admin_username" { type = string }

# Image reference
variable "image_publisher" { type = string }
variable "image_offer"     { type = string }
variable "image_sku"       { type = string }
variable "image_version"   { type = string }

# VMAccessForLinux Extension protected settings
variable "ext_username" {
  type      = string
  default   = ""
  sensitive = true
}

variable "ext_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "ext_ssh_key" {
  type      = string
  default   = ""
  sensitive = true
}

variable "ext_reset_ssh" {
  type      = string
  default   = "false"
  sensitive = true
}

variable "ext_remove_user" {
  type      = string
  default   = "false"
  sensitive = true
}

variable "ext_expiration" {
  type      = string
  default   = "9999-12-31T23:59:59Z"
  sensitive = true
}
variable "admin_ssh_public_key" {
  type    = string
  default = ""
}

