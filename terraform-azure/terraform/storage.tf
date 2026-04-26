resource "azurerm_storage_account" "datalake" {
  name                     = "aewt${random_integer.ri.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  is_hns_enabled = true

  blob_properties {
    versioning_enabled = true
  }
}

resource "azurerm_storage_container" "layers" {
  for_each              = toset(["bronze", "silver", "gold"])
  name                  = each.key

  # REQUIRED in AzureRM v4.x
  storage_account_name  = azurerm_storage_account.datalake.name

  container_access_type = "private"
}

resource "azurerm_storage_container" "checkpoints" {
  name                  = "checkpoints"

  # REQUIRED in AzureRM v4.x
  storage_account_name  = azurerm_storage_account.datalake.name

  container_access_type = "private"
}
