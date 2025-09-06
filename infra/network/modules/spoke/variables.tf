variable "resource_group_name" {
  type        = string
  description = "Resource group of the spoke"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "spoke_vnet_name" {
  type        = string
  description = "Name of spoke VNet"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for spoke VNet"
}

variable "hub_vnet_id" {
  type        = string
  description = "ID of hub VNet"
}

variable "hub_vnet_name" {
  type        = string
  description = "Name of hub VNet"
}

variable "hub_resource_group_name" {
  type        = string
  description = "Resource group name of hub"
}
