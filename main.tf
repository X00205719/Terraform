terraform {
  required_version = ">= 1.7.5"
  backend "azurerm" {
    resource_group_name  = "Terraform"
    storage_account_name = "terraformlo"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
  }
}
 
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "kubernetes" {
  name     = "kubernetes"
  location = "West Europe"
}
