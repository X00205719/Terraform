terraform {
  backend "azurerm" {
    storage_account_name = "terraformlo"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}