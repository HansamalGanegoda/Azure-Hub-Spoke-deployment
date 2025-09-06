variable "resource_group_name" {
  type        = string
  description = "Name of the resource group for hub"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "hub_vnet_name" {
  type        = string
  description = "Name of hub VNet"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for hub VNet"
  default     = ["10.0.0.0/16"]
}
