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

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.kubernetes.location
  resource_group_name = azurerm_resource_group.kubernetes.name
  dns_prefix          = "myakscluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  service_mesh_profile {
    mode = "Istio"
  }
}

resource "azurerm_container_registry" "container_registry" {
  name                     = "lostud"
  resource_group_name      = azurerm_resource_group.kubernetes.name
  location                 = azurerm_resource_group.kubernetes.location
  sku                      = "Basic"
  admin_enabled            = true // Change this according to your needs
}