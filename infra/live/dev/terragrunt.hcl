terraform {
  source = "../../network/modules//hub_spokes"
}

# All variables intentionally left without defaults so Terragrunt/Terraform will prompt.
inputs = {
  # subscription_id must be provided at runtime (prompt)
  # naming inputs: hub & 3 spokes
  # Example addresses (adjust when prompted):
  # hub_address_space  = "10.0.0.0/16"
  # vnet1_address_space = "10.1.0.0/16"
  # vnet2_address_space = "10.2.0.0/16"
  # vnet3_address_space = "10.3.0.0/16"
}
