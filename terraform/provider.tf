provider "azurerm" {
  subscription_id = ""
  tenant_id       = ""
  features {

  }
}


terraform {
  backend "azurerm" {
    subscription_id      = ""
    tenant_id            = ""
    resource_group_name  = "tfstate"
    storage_account_name = "tfstatelab01"
    container_name       = "tfstate"
    key                  = "lab01.tfstate"
  }
}
