resource "random_string" "username" {
  length  = 8
  upper   = true
  lower   = true
  number  = false
  special = false
}


resource "random_password" "password" {
  length           = 16
  upper            = true
  lower            = true
  number           = true
  special          = true
}




resource "azurerm_linux_virtual_machine" "dev-vm" {
    for_each = var.dev_vm
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    size = each.value.size
    admin_username = random_string.username.result
    admin_password = random_password.password.result
    network_interface_ids = each.value.network_interface_ids
    disable_password_authentication = false
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
}