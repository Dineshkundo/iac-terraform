variable "subscription_id" { type = string }
variable "tenant_id"       { type = string }

variable "resource_group_name" { type = string }
variable "location"            { type = string }

variable "vm_name" { type = string }
variable "vm_size" { type = string }

variable "nic_id"      { type = string }
variable "os_disk_id"  { type = string }
variable "data_disk_id" { type = string }

variable "admin_username" { type = string }

variable "image_publisher" { type = string }
variable "image_offer"     { type = string }
variable "image_sku"       { type = string }
variable "image_version"   { type = string }

variable "tags" {
  type = map(string)
  default = {}
}

# Extension vars – defaults for import; you don’t need values
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
  default   = ""
  sensitive = true
}

variable "ext_remove_user" {
  type      = string
  default   = ""
  sensitive = true
}

variable "ext_expiration" {
  type      = string
  default   = ""
  sensitive = true
}
