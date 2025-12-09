locals {
  base_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network"

  # Dynamic Route Table IDs created from tfvars values
  route_tables = {
    for key, name in var.route_tables :
    key => "${local.base_id}/routeTables/${name}"
  }

  # Dynamic NSG IDs created from tfvars values
  nsgs = {
    for name, _ in var.nsgs :
    name => "${local.base_id}/networkSecurityGroups/${name}"
  }
}

