############################################################
# NETWORK SECURITY GROUPS
############################################################
resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsgs
  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
############################################################
# SUBNET → NSG ASSOCIATION
############################################################
resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  for_each = {
    for key, subnet in var.subnets :
    key => subnet if lookup(subnet, "nsg_name", null) != null
  }

  subnet_id = azurerm_subnet.subnets[each.key].id

  network_security_group_id = local.nsgs[each.value.nsg_name]
}

