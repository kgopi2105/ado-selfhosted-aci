resource "random_string" "suffix_code" {
  length  = 3
  special = false
}

locals {
  project_code = "${var.projectname}${random_string.suffix_code.result}"

}

data "azurerm_client_config" "current_config" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${local.project_code}"
  location = "westeurope"
  tags     = var.tags
}
