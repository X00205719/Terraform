provider "azurerm" {
  use_oidc = true
  features {}
}

resource "azurerm_resource_group" "kubernetes" {
  name     = "kubernetes"
  location = "West Europe"
}