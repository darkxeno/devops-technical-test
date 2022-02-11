

resource "azurerm_postgresql_server" "postgres-server" {
  name                = "${var.app_name}-${var.environment_name}-postgres-server"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 30
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  version                      = "11"
  ssl_enforcement_enabled      = true

  #public_network_access_enabled = false // Still not supported
  ssl_minimal_tls_version_enforced = "TLS1_2"

  tags = var.additional_tags
}

resource "azurerm_postgresql_database" "postgres-db" {
  name                = "${var.app_name}-${var.environment_name}"
  resource_group_name = var.resource_group.name
  server_name         = azurerm_postgresql_server.postgres-server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}