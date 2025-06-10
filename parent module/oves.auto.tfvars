rgkaname                      = "rg-oves-env"
rgkalocation                  = "polandcentral"
ventkaname                    = "app-vnet"
address_space                 = ["10.0.0.0/16"]
address_prefixes              = ["10.0.20.0/24"]
subnetkaname                  = "frontendsubnet"
address_prefixes1             = ["10.0.1.0/24"]
subnetkaname1                 = "backendsubnet"
pipkaname                     = "frontendpip"
pipkaname1                    = "backendpip"
allocation_method             = "Static"
nickaname                     = "frontendnic"
ipkaname                      = "fnip"
subnet_id                     = "/subscriptions/af4c13b7-6f21-4684-a981-6f96cb90a98b/resourceGroups/rg-oves-env/providers/Microsoft.Network/virtualNetworks/app-vnet/subnets/frontendsubnet"
private_ip_address_allocation = "Dynamic"
nickaname1                    = "backendnic"
ipkaname1                     = "benip"
subnet_id1                    = "/subscriptions/af4c13b7-6f21-4684-a981-6f96cb90a98b/resourceGroups/rg-oves-env/providers/Microsoft.Network/virtualNetworks/app-vnet/subnets/backendsubnet"

public_ip = "/subscriptions/af4c13b7-6f21-4684-a981-6f96cb90a98b/resourceGroups/rg-oves-env/providers/Microsoft.Network/publicIPAddresses/frontendpip"

public_ip1 = "/subscriptions/af4c13b7-6f21-4684-a981-6f96cb90a98b/resourceGroups/rg-oves-env/providers/Microsoft.Network/publicIPAddresses/backendpip"

network_security_group_id = "/subscriptions/af4c13b7-6f21-4684-a981-6f96cb90a98b/resourceGroups/rg-oves-env/providers/Microsoft.Network/networkSecurityGroups/frontendnsg"


network_security_group_id1 = "/subscriptions/af4c13b7-6f21-4684-a981-6f96cb90a98b/resourceGroups/rg-oves-env/providers/Microsoft.Network/networkSecurityGroups/backendnsg"



vmkaname                        = "frontendvm"
size                            = "Standard_F2"
admin_username                  = "ovesadmin"
admin_password                  = "Abc@123456789"
disable_password_authentication = false
network_interface_ids           = "/subscriptions/af4c13b7-6f21-4684-a981-6f96cb90a98b/resourceGroups/rg-oves-env/providers/Microsoft.Network/networkInterfaces/frontendnic"
caching                         = "ReadWrite"
storage_account_type            = "Standard_LRS"
publisher                       = "canonical"
offer                           = "0001-com-ubuntu-server-jammy"
sku                             = "22_04-lts"
vm_version                      = "latest"




vmkaname1              = "backendvm"
size1                  = "Standard_F2"
admin_username1        = "ovesadmin1"
admin_password1        = "Abc@123456789"
network_interface_ids1 = "/subscriptions/af4c13b7-6f21-4684-a981-6f96cb90a98b/resourceGroups/rg-oves-env/providers/Microsoft.Network/networkInterfaces/backendnic"
caching1               = "ReadWrite"
publisher1             = "canonical"
offer1                 = "0001-com-ubuntu-server-focal"
sku1                   = "20_04-lts"



nsgkaname               = "frontendnsg"
destination_port_ranges = ["80", "22"]
securityname            = "frontend"

nsgkaname1               = "backendnsg"
destination_port_ranges1 = ["80", "22", "8000"]
securityname1            = "backend"