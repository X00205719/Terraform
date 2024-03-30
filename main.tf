provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "kubernetes" {
  name     = "kubernetes"
  location = "West Europe"
}