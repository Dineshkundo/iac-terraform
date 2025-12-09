terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  use_msi                         = true
  subscription_id                 = var.subscription_id
  tenant_id                       = var.tenant_id
  resource_provider_registrations = "none"
}

