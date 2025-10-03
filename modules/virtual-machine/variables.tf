variable "dev_vm" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
        size = string
        network_interface_ids = list(string)
    }))
  
}