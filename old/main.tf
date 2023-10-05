resource "azurerm_resource_group" "this" {
  name     = "12345-tf_test_resource_group"
  location = "Australia SouthEast"
}

resource "azurerm_storage_account" "this" {
  name                     = "tfteststoraccount"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "this" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "this" {
  name                   = "test.txt"
  storage_account_name   = azurerm_storage_account.this.name
  storage_container_name = azurerm_storage_container.this.name
  type                   = "Block"
  source                 = "./test.txt"
  
}