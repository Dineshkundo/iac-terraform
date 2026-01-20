############################################################
# ROUTE TABLE CREATION
############################################################

resource "azurerm_route_table" "route_tables" {
  for_each = var.route_tables

  name                = each.value # the name from tfvars
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}




###########################################################
# ROUTE TABLE ASSOCIATION 
############################################################
resource "azurerm_subnet_route_table_association" "route_assoc" {
  for_each = {
    for key, subnet in var.subnets :
    key => subnet
    if lookup(subnet, "route_table_name", null) != null
  }

  subnet_id      = azurerm_subnet.subnets[each.key].id
  route_table_id = local.route_tables[each.value.route_table_name]
}

