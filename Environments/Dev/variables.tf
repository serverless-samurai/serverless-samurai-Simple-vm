variable "module_rg" {
  type = map(object({
    name = string
    location = string
  }
  ))

}

variable "module_stg_account" {
    description = "This storage account used for backend "
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    account_tier = string
    account_replication_type = string
  }))
}

variable "module_vnet" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
        address_space = list(string)
    }))
  
}


variable "module_snet" {
    type = map(object({
        name = string
        resource_group_name = string
        virtual_network_name = string
        address_prefixes = list(string)
    }))
  
}

variable "module_nic" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
        ip_configuration = list(object({
            name = string
            subnet_id = string
            private_ip_address_allocation = string
        }))
    }))
  
}

variable "module_vm" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
        size = string
        network_interface_ids = list(string)
    }))
  
}
variable "module_nsg" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
    }))
  
}