resource "random_string" "main" {
  length  = 8
  upper   = false
  special = false
}

resource "azurerm_storage_account" "sample" {
  name                     = "st${random_string.main.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "sample" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.sample.name
  container_access_type = "private"
}