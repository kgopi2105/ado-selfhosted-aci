resource "azurerm_network_profile" "acinetworkprofile" {
  name                = "aci-${local.project_code}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  container_network_interface {
    name = "ci-nic-${local.project_code}"

    ip_configuration {
      name      = "ipconfig"
      subnet_id = azurerm_subnet.acisnet.id
    }
  }
}



resource "azurerm_container_group" "selfhostedagent" {
  location            = azurerm_resource_group.rg.location
  name                = "adoselfagent"
  os_type             = "Linux"
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "private"
  network_profile_id  = azurerm_network_profile.acinetworkprofile.id
  tags                = var.tags
  container {
    cpu      = 1
    image    = "kgopi1/azselfhostedagent:latest"
    memory   = 1.5
    name     = "azselfhostedagent"
    commands = []
    environment_variables = {
      AZP_URL        = azurerm_key_vault_secret.adosecrets["AZP-URL"].value
      AZP_TOKEN      = azurerm_key_vault_secret.adosecrets["AZP-TOKEN"].value
      AZP_AGENT_NAME = azurerm_key_vault_secret.adosecrets["AZP-AGENT-NAME"].value
    }
    ports {
      port     = 8080
      protocol = "TCP"
    }
  }
  restart_policy = "OnFailure"
}
