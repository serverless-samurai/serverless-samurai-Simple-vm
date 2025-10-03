variable "dev_stg_account" {
    description = "This storage account used for backend "
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    account_tier = string
    account_replication_type = string
  }))
}