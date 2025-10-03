terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0" # Specify the version
    }
  }
}

provider "azurerm" {
  features {} # Required block for AzureRM provider
}

provider "azuread" {
  # optional: specify version
}

# Data block to fetch your user by UPN (email)
data "azuread_user" "current_user" {
  user_principal_name = "admin@Iws141.onmicrosoft.com"
}

output "current_user_object_id" {
  value = data.azuread_user.current_user.object_id
}