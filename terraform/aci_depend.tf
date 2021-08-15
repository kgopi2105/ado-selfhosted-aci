resource "random_password" "vmpasswd" {
  length = 16
}

resource "azurerm_key_vault" "kv" {
  location            = azurerm_resource_group.rg.location
  name                = "kv-${local.project_code}"
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current_config.tenant_id
}

resource "azurerm_key_vault_access_policy" "spkvaccess" {
  key_vault_id       = azurerm_key_vault.kv.id
  object_id          = data.azurerm_client_config.current_config.object_id
  tenant_id          = data.azurerm_client_config.current_config.tenant_id
  secret_permissions = ["Backup", "Delete", "get", "list", "purge", "recover", "restore", "set"]
}

resource "azurerm_key_vault_access_policy" "userkvaccess" {
  key_vault_id       = azurerm_key_vault.kv.id
  object_id          = "4de5e895-a0a3-48e7-b3da-1be81f968a96"
  tenant_id          = data.azurerm_client_config.current_config.tenant_id
  secret_permissions = ["Backup", "Delete", "get", "list", "purge", "recover", "restore", "set"]
}

resource "azurerm_key_vault_secret" "adosecrets" {
  for_each     = var.ado_secerts
  key_vault_id = azurerm_key_vault.kv.id
  name         = each.key
  value        = each.value
  depends_on = [
    azurerm_key_vault_access_policy.spkvaccess
  ]
  lifecycle {
    ignore_changes = [value]
  }
}
