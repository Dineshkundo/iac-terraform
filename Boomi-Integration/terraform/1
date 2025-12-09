variable "subscription_id" { type = string }
variable "tenant_id"       { type = string }

variable "resource_group_name" { type = string }
variable "location"            { type = string }

variable "vm_name" { type = string }
variable "vm_size" { type = string }
variable "zone"    {type = string}

variable "nic_id"     { type = string }
variable "os_disk_id" { type = string }

variable "tags" {
  type    = map(string)
  default = {}
}

# VM Extension variables — no secrets required
variable "ext_username" {
  type    = string
  default = ""
}

variable "ext_password" {
  type    = string
  default = ""
}

variable "ext_ssh_key" {
  type    = string
  default = ""
}

variable "ext_reset_ssh" {
  type    = string
  default = ""
}

variable "ext_remove_user" {
  type    = string
  default = ""
}

variable "ext_expiration" {
  type    = string
  default = ""
}

