locals {
  hub_inputs = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
}

terraform {
  source = "../../../network/modules//spoke"
}

inputs = {
  resource_group_name     = "rg-spokes-dev"
  location                = "eastus"
  hub_vnet_id             = dependency.hub.outputs.hub_vnet_id
  hub_vnet_name           = dependency.hub.outputs.hub_vnet_name
  hub_resource_group_name = dependency.hub.outputs.hub_resource_group_name
  # Override these per additional spoke deployment
  spoke_vnet_name = "spoke-extra"
  address_space   = ["10.10.0.0/16"]
}

dependency "hub" {
  config_path = ".."  # parent dev terragrunt.hcl providing hub_spokes deployment
}
