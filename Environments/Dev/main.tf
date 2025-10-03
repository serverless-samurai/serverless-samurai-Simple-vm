module "rg" {
  source = "../../modules/rg"
  dev_rg = var.module_rg

}

module "storage-account" {
    source = "../../modules/storage-account"
    dev_stg_account = var.module_stg_account
    depends_on = [ var.module_rg ]
  
}

module "vnet" {
    source = "../../modules/virtual-network"
    dev_vnet = var.module_vnet
    depends_on = [ var.module_rg ]
}
module "snet" {
    source = "../../modules/subnet"
    dev_snet = var.module_snet
    depends_on = [ module.vnet ]
  
}

module "nic" {
    source = "../../modules/nic"
    dev_nic = var.module_nic
    depends_on = [ module.snet ]
  
}

module "vm" {
    source = "../../modules/virtual-machine"
    dev_vm = var.module_vm
    depends_on = [ module.nic ]
  
}
module "nsg" {
    source = "../../modules/nsg"
    dev_nsg = var.module_nsg
    depends_on = [ var.module_rg ]
  
}