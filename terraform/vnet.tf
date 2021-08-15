resource "azurerm_virtual_network" "vnet" {
  address_space       = ["10.0.0.0/22"]
  location            = azurerm_resource_group.rg.location
  name                = "vnet-${var.projectname}"
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}


resource "azurerm_subnet" "acisnet" {
  name                 = "snet-${var.projectname}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/28"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "acisnetdelgation"
    service_delegation {
      name = "Microsoft.ContainerInstance/containerGroups"
    }
  }
}



