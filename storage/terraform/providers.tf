/******************************************
  Provider backend store
  You must set the local application credentials using :
  Using Managed-identity login
 *****************************************/
terraform {
  backend "azurerm" {}
}



provider "azurerm" {
  features {}
  use_msi                         = true
  subscription_id                 = var.subscription_id
  tenant_id                       = var.tenant_id
  # IMPORTANT: Disable RP auto-registration for MSI, Terraform by default tries to register all Azure providers it supports:
  resource_provider_registrations = "none"
}

