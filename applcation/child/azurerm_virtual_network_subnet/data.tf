data "azurerm_network_security_group" "nsgid" {
  name                = "nsg-env-001"
  resource_group_name = "rg-env-001"
}