data "azurerm_client_config" "current" {
  
}

output "tenant_id" {
    value = data.azurerm_client_config.current.tenant_id
  
}
 output "subscription_id" {
    value = data.azurerm_client_config.current.subscription_id
   
 }


resource "azurerm_key_vault" "dev-kv" {
    name = "dev-kv"
    location = "centralindia"
    resource_group_name = "dev_rg"
    tenant_id = data.azurerm_client_config.current.tenant_id
    sku_name = "standard"
    soft_delete_retention_days = 7
    purge_protection_enabled = false

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azuread_user.current_user.object_id

        key_permissions = ["Get","Create","Delete"]
        secret_permissions = ["Get","Set"]
        storage_permissions = ["Get"]
    }
  
}