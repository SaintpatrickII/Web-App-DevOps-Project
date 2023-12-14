variable "resource_group_name" {
	description = "Name of resource group"
	type = string
}

variable "location" {
	description = "region which resources are located"
	type = string
}

variable "vnet_address_space" {
	description = "range of vnet addresses"
	type = list(string)
}

variable "myip" {
	type = string
	default = "84.68.135.199"
}



