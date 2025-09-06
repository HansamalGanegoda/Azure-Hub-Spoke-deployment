terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.100.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Hub network
module "hub" {
  source              = "../hub"
  resource_group_name = var.hub_resource_group_name
  location            = var.location
  hub_vnet_name       = var.hub_vnet_name
  address_space       = [var.hub_address_space]
}

# Shared resource group for spokes
resource "azurerm_resource_group" "spokes" {
  name     = var.spokes_resource_group_name
  location = var.location
}

# Spoke 1
module "spoke1" {
  source                  = "../spoke"
  resource_group_name     = azurerm_resource_group.spokes.name
  location                = var.location
  spoke_vnet_name         = var.vnet1_name
  address_space           = [var.vnet1_address_space]
  hub_vnet_id             = module.hub.hub_vnet_id
  hub_vnet_name           = var.hub_vnet_name
  hub_resource_group_name = var.hub_resource_group_name
}

# Spoke 2
module "spoke2" {
  source                  = "../spoke"
  resource_group_name     = azurerm_resource_group.spokes.name
  location                = var.location
  spoke_vnet_name         = var.vnet2_name
  address_space           = [var.vnet2_address_space]
  hub_vnet_id             = module.hub.hub_vnet_id
  hub_vnet_name           = var.hub_vnet_name
  hub_resource_group_name = var.hub_resource_group_name
}

# Spoke 3
module "spoke3" {
  source                  = "../spoke"
  resource_group_name     = azurerm_resource_group.spokes.name
  location                = var.location
  spoke_vnet_name         = var.vnet3_name
  address_space           = [var.vnet3_address_space]
  hub_vnet_id             = module.hub.hub_vnet_id
  hub_vnet_name           = var.hub_vnet_name
  hub_resource_group_name = var.hub_resource_group_name
}

output "hub_vnet_id" {
  value = module.hub.hub_vnet_id
}

output "spoke_vnet_ids" {
  value = [module.spoke1.spoke_vnet_id, module.spoke2.spoke_vnet_id, module.spoke3.spoke_vnet_id]
}

# Expose hub properties so downstream Terragrunt configs can reference them via dependency.outputs
output "hub_vnet_name" {
  value = var.hub_vnet_name
}

output "hub_resource_group_name" {
  value = var.hub_resource_group_name
}