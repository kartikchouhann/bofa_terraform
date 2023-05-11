resource "azurerm_key_vault" "example" {
  name                        = "example-keyvault"
  location                    = azurerm_resource_group.az_rg.location
  resource_group_name         = azurerm_resource_group.az_rg.name
  tenant_id                   = "<your-tenant-id>"
  enabled_for_disk_encryption = true
}

resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = azurerm_key_vault.example.id
  
  secret_permissions = [
    "get",
    "list"
  ]
}

  addon_profile {
    azure_keyvault {
      enabled = true
      keyvault_id = azurerm_key_vault.example.id
      operator_mode = true
    }
  }
}
