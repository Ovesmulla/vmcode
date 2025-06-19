resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  location            = var.virtual_network_location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  

  subnet {
    name             = var.subnet_name
    address_prefixes = var.address_prefixes
    security_group   = data.azurerm_network_security_group.nsgid.id
  }

  subnet {
    name             = var.subnet_name1
    address_prefixes = var.address_prefixes1
    security_group   = data.azurerm_network_security_group.nsgid.id
  }


}

