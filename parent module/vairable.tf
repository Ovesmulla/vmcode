variable "rgkaname" {}
variable "rgkalocation" {}


# Vnet variable 
variable "ventkaname" {}
variable "address_space" {}


# Subnet Variable 
variable "address_prefixes" {}
variable "subnetkaname" {}
variable "address_prefixes1" {}
variable "subnetkaname1" {}


# PIP Variable 
variable "pipkaname" {}
variable "allocation_method" {}
variable "pipkaname1" {}
variable "nickaname" {}
variable "ipkaname" {}
variable "subnet_id" {}


# NIC Variable 
variable "private_ip_address_allocation" {}
variable "nickaname1" {}
variable "ipkaname1" {}
variable "subnet_id1" {}
variable "public_ip" {}
variable "public_ip1" {}

# VM Variable 
variable "vmkaname" {}
variable "size" {}
variable "admin_username" {}
variable "admin_password" {}
variable "disable_password_authentication" {}
variable "network_interface_ids" {}
variable "caching" {}
variable "storage_account_type" {}
variable "publisher" {}
variable "offer" {}
variable "sku" {}
variable "vm_version" {}



variable "vmkaname1" {}
variable "size1" {}
variable "admin_username1" {}
variable "admin_password1" {}
variable "network_interface_ids1" {}
variable "caching1" {}
variable "publisher1" {}
variable "offer1" {}
variable "sku1" {}




# NSG variable
variable "nsgkaname" {}
variable "destination_port_ranges" {}
variable "securityname" {}


variable "nsgkaname1" {}
variable "destination_port_ranges1" {}
variable "securityname1" {}




variable "network_security_group_id" {

}
variable "network_security_group_id1" {

}