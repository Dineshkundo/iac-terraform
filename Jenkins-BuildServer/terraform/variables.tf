variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}


variable "data_disk_id" {
  type = string
  default = ""
}
variable "nic_name" { type = string }
variable "os_disk_name" { type = string }

variable "vm_name" { type = string }
variable "vm_size" { type = string }
variable "zone"    { type = string }


# SSH public key file path (not the key)
variable "ssh_key_path"   { type = string }
variable "admin_username" { type = string }


# Image reference
variable "image_publisher" { type = string }
variable "image_offer"     { type = string }
variable "image_sku"       { type = string }
variable "image_version"   { type = string }

variable "tags" {
  type    = map(string)
  default = {}
}

