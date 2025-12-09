output "sql_server_id" {
  value = azurerm_mssql_server.sql.id
}

output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql.fully_qualified_domain_name
}

output "database_ids" {
  value = { for k, db in azurerm_mssql_database.databases : k => db.id }
}

output "private_endpoints" {
  value = { for k, pe in azurerm_private_endpoint.pe : k => pe.id }
}

