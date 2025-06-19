module "resource_group_name" {
  source     = "../child/azurerm_resource_group"
  rgname     = "rg-env-001"
  rglocation = "East US"
}


module "azurerm_network_security_group" {
  depends_on = [module.resource_group_name]
  source     = "../child/azurerm_nsg"
  nsg_name   = "nsg-env-001"
  location   = "East US"
  rgname     = "rg-env-001"
}

module "virtual_network_subnet" {
  depends_on               = [module.resource_group_name, module.azurerm_network_security_group]
  source                   = "../child/azurerm_virtual_network_subnet"
  virtual_network_name     = "vnet-env-001"
  virtual_network_location = "East US"
  resource_group_name      = "rg-env-001"
  address_space            = ["10.0.0.0/16"]
  subnet_name              = "subnet-env-001"
  address_prefixes         = ["10.0.10.0/24"]
  subnet_name1             = "subnet-env-002"
  address_prefixes1        = ["10.20.0.0/24"]

}
module "public_ip_address_id" {
  depends_on          = [module.resource_group_name]
  source              = "../child/azurerm_public_ip"
  pip_name            = "public-ip-env-001"
  allocation_method   = "Dynamic"
  location            = "East US"
  resource_group_name = "rg-env-001"
}

module "public_ip_address_id1" {
  depends_on          = [module.resource_group_name]
  source              = "../child/azurerm_public_ip"
  pip_name            = "public-ip-env-002"
  allocation_method   = "Dynamic"
  location            = "East US"
  resource_group_name = "rg-env-001"
}

module "azurerm_vm_nic" {
  depends_on           = [module.resource_group_name, module.virtual_network_subnet, module.public_ip_address_id]
  source               = "../child/azurerm_vm_nic"
  nic_name             = "nic-env-001"
  location             = "East US"
  resource_group_name  = "rg-env-001"
  ip_name              = "ip-env-001"
  # public_ip_address_id = module.public_ip_address_id.public_ip_address_id
  vm_name              = "vm-env-001"
}
module "azurerm_vm_nic1" {
  depends_on           = [module.resource_group_name, module.virtual_network_subnet, module.public_ip_address_id]
  source               = "../child/azurerm_vm_nic"
  nic_name             = "nic-env-002"
  location             = "East US"
  resource_group_name  = "rg-env-001"
  ip_name              = "ip-env-001"
  # public_ip_address_id = module.public_ip_address_id.public_ip_address_id
  vm_name              = "vm-env-001"
}
