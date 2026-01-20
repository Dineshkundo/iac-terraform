locals {
  tags = var.tags

  ip_rules   = var.allowed_ip_rules
  subnets    = var.virtual_network_subnet_ids

  containers = toset(var.blob_containers)

  shares = {
    for share in var.file_shares : share.name => share
  }

  scopes = {
    for s in var.encryption_scopes : s.name => s
  }
}

