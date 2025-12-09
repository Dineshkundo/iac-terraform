############################################
# Azure MSSQL Server
############################################
resource "azurerm_mssql_server" "sql" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  version             = "12.0"

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  minimum_tls_version           = "1.2"
  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags

  lifecycle {
    ignore_changes = [
      administrator_login_password,
      express_vulnerability_assessment_enabled,
      identity,
      azuread_administrator,
    ]
  }
}

############################################
# Virtual Network Rule
############################################
resource "azurerm_mssql_virtual_network_rule" "vnet_rule" {
  count     = var.vnet_rule_enabled ? 1 : 0
  name      = var.vnet_rule_name
  server_id = azurerm_mssql_server.sql.id
  subnet_id = var.virtual_network_subnet_id
}

############################################
# Databases (map-based)
############################################
resource "azurerm_mssql_database" "databases" {
  for_each  = var.db_names
  name      = each.value
  server_id = azurerm_mssql_server.sql.id

  sku_name           = lookup(var.db_sku_map, each.key, var.default_db_sku)
  zone_redundant     = lookup(var.db_zone_redundant_map, each.key, false)
  read_scale         = lookup(var.db_read_scale_map, each.key, false)
  read_replica_count = lookup(var.db_read_replica_count_map, each.key, 0)
  tags               = lookup(var.db_tags, each.key, {})
}

############################################

############################################
# Private Endpoints (if imported)
############################################
resource "azurerm_private_endpoint" "pe" {
  for_each = var.pe_names

  name                          = each.value
  resource_group_name           = var.private_endpoint_resource_group
  location                      = var.location
  subnet_id                     = var.private_endpoint_subnet_id

  private_service_connection {
    name                           = each.value
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mssql_server.sql.id
    subresource_names              = lookup(var.pe_subresources, each.key, [])
  }
  # Fully dynamic DNS zone group
  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  tags = lookup(var.pe_tags, each.key, {})
  # Terraform cannot set these. Azure decides them.
  lifecycle {
    ignore_changes = [
   custom_network_interface_name,
    network_interface,
    private_dns_zone_group,
    private_dns_zone_configs,
    private_service_connection,
    custom_dns_configs,
    tags, 
   ]
  }

}
############################################
