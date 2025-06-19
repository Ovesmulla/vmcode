data "azurerm_subnet" "subnet_id" {
  name                 = "subnet-env-001"
  virtual_network_name = "vnet-env-001"
  resource_group_name  = "rg-env-001"
}

data "azurerm_subnet" "subnet_id1" {
  name                 = "subnet-env-002"
  virtual_network_name = "vnet-env-001"
  resource_group_name  = "rg-env-001"
}

data "azurerm_public_ip" "public_ip_address_id" {
  name                = "public-ip-env-001"
  resource_group_name = "rg-env-001"
}
data "azurerm_public_ip" "public_ip_address_id1" {
  name                = "public-ip-env-002"
  resource_group_name = "rg-env-001"
}

output "nic_id" {
  value = azurerm_network_interface.nic1.id
}
