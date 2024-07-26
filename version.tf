# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

   backend "azurerm" {
    resource_group_name  = "example-resources"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "st3vxhbce0"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "vhds"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "sample-backend"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }

}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# # Create a resource group
# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "West Europe"
# }

# # Create a virtual network within the resource group
# resource "azurerm_virtual_network" "example" {
#   name                = "