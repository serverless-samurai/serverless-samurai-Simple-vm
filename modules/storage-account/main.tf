resource "azurerm_storage_account" "stg-acc" {
    for_each = var.dev_stg_account
    name = each.value.location
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    account_tier = each.value.account_tier
    account_replication_type = each.value.account_replication_type
  
}