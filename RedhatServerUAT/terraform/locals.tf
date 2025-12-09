locals {
  nic_name       = element(split("/", var.nic_id), 8)
  nic_rg         = element(split("/", var.nic_id), 4)

  os_disk_name   = element(split("/", var.os_disk_id), 8)
  os_disk_rg     = element(split("/", var.os_disk_id), 4)

  data_disk_name = element(split("/", var.data_disk_id), 8)
  data_disk_rg   = element(split("/", var.data_disk_id), 4)
}
