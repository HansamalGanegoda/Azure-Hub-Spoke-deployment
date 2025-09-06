variable "subscription_id" {
	type        = string
	description = "Azure subscription id (prompted)"
}

variable "location" {
	type        = string
	description = "Azure region"
	default     = "eastus"
}

variable "hub_resource_group_name" {
	type        = string
	description = "Hub RG name"
	default     = "rg-hub"
}

variable "spokes_resource_group_name" {
	type        = string
	description = "Spokes RG name"
	default     = "rg-spokes"
}

variable "hub_vnet_name" {
	type        = string
	description = "Hub VNet name (prompted)"
}

variable "hub_address_space" {
	type        = string
	description = "Hub VNet address space (single CIDR)"
	default     = "10.0.0.0/16"
}

variable "vnet1_name" {
	type        = string
	description = "Spoke1 VNet name (prompted)"
}

variable "vnet1_address_space" {
	type        = string
	description = "Spoke1 CIDR"
	default     = "10.1.0.0/16"
}

variable "vnet2_name" {
	type        = string
	description = "Spoke2 VNet name (prompted)"
}

variable "vnet2_address_space" {
	type        = string
	description = "Spoke2 CIDR"
	default     = "10.2.0.0/16"
}

variable "vnet3_name" {
	type        = string
	description = "Spoke3 VNet name (prompted)"
}

variable "vnet3_address_space" {
	type        = string
	description = "Spoke3 CIDR"
	default     = "10.3.0.0/16"
}