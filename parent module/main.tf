terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "af4c13b7-6f21-4684-a981-6f96cb90a98b"
}

module "rgcalling" {
  source   = "../child module/resourcegroup"
  name     = var.rgkaname
  location = var.rgkalocation
}

module "vnetcalling" {
  source              = "../child module/vent"
  depends_on          = [module.rgcalling]
  name                = var.ventkaname
  location            = var.rgkalocation
  resource_group_name = var.rgkaname
  address_space       = var.address_space
}

module "subnecalling" {
  source               = "../child module/subnet"
  depends_on           = [module.vnetcalling]
  name                 = var.subnetkaname
  resource_group_name  = var.rgkaname
  virtual_network_name = var.ventkaname
  address_prefixes     = var.address_prefixes
}
module "subnecalling1" {
  source               = "../child module/subnet"
  depends_on           = [module.vnetcalling]
  name                 = var.subnetkaname1
  resource_group_name  = var.rgkaname
  virtual_network_name = var.ventkaname
  address_prefixes     = var.address_prefixes1
}

module "pipcalling" {
  source              = "../child module/pip"
  depends_on          = [module.subnecalling]
  name                = var.pipkaname
  resource_group_name = var.rgkaname
  location            = var.rgkalocation
  allocation_method   = var.allocation_method

}
module "pipcalling1" {
  depends_on          = [var.subnetkaname1]
  source              = "../child module/pip"
  name                = var.pipkaname1
  resource_group_name = var.rgkaname
  location            = var.rgkalocation
  allocation_method   = var.allocation_method

}

module "niccalling" {
  source                        = "../child module/nic"
  depends_on                    = [module.pipcalling]
  name                          = var.nickaname
  location                      = var.rgkalocation
  resource_group_name           = var.rgkaname
  ipname                        = var.ipkaname
  subnet_id                     = var.subnet_id
  private_ip_address_allocation = var.private_ip_address_allocation
  public_ip                     = var.public_ip
}


module "niccalling1" {
  source                        = "../child module/nic"
  depends_on                    = [module.pipcalling1]
  name                          = var.nickaname1
  location                      = var.rgkalocation
  resource_group_name           = var.rgkaname
  ipname                        = var.ipkaname1
  subnet_id                     = var.subnet_id1
  private_ip_address_allocation = var.private_ip_address_allocation
  public_ip                     = var.public_ip1

}


module "vmcalling" {
  source                          = "../child module/vm"
  depends_on                      = [module.niccalling]
  name                            = var.vmkaname
  resource_group_name             = var.rgkaname
  location                        = var.rgkalocation
  size                            = var.size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = var.disable_password_authentication
  network_interface_ids           = var.network_interface_ids
  caching                         = var.caching
  storage_account_type            = var.storage_account_type
  publisher                       = var.publisher
  offer                           = var.offer
  sku                             = var.sku
  vm_version                      = var.vm_version
}


module "vmcalling1" {
  source                          = "../child module/vm"
  depends_on                      = [module.niccalling]
  name                            = var.vmkaname1
  resource_group_name             = var.rgkaname
  location                        = var.rgkalocation
  size                            = var.size1
  admin_username                  = var.admin_username1
  admin_password                  = var.admin_password1
  disable_password_authentication = var.disable_password_authentication
  network_interface_ids           = var.network_interface_ids1
  caching                         = var.caching1
  storage_account_type            = var.storage_account_type
  publisher                       = var.publisher1
  offer                           = var.offer1
  sku                             = var.sku1
  vm_version                      = var.vm_version
}


module "nsgcalling" {
  source                    = "../child module/nsg"
  depends_on                = [module.niccalling]
  name                      = var.nsgkaname
  location                  = var.rgkalocation
  resource_group_name       = var.rgkaname
  destination_port_ranges   = var.destination_port_ranges
  securityname              = var.securityname
  network_interface_id      = var.network_interface_ids
  network_security_group_id = var.network_security_group_id
}


module "nsgcalling1" {
  source                    = "../child module/nsg"
  depends_on                = [module.niccalling1]
  name                      = var.nsgkaname1
  location                  = var.rgkalocation
  resource_group_name       = var.rgkaname
  destination_port_ranges   = var.destination_port_ranges1
  securityname              = var.securityname1
  network_interface_id      = var.network_interface_ids1
  network_security_group_id = var.network_security_group_id1
}
