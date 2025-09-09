# Azure Hub & Spoke Deployment (Terraform + Terragrunt)

This repository contains a minimal Azure hub-and-spoke virtual network topology using Terraform modules orchestrated by Terragrunt.
![Uploading ChatGPT Image Sep 9, 2025, 02_12_31 PM.png…]()


## Structure
```
infra/
  network/
    providers.tf          # AzureRM provider + required providers
    variables.tf          # subscription_id variable
    modules/
      hub/                # Hub VNet + RG + gateway subnet
      spoke/              # Spoke VNet + peerings to hub
      hub_spokes/         # Composite module: hub + 3 spokes + outputs
  live/
    dev/
      terragrunt.hcl      # Deploy hub + 3 spokes via hub_spokes module
      spokes/terragrunt.hcl  # (Optional) extra spoke example
```

## Usage
From `infra/live/dev`:

1. Initialize:
   terragrunt init
2. Plan (will prompt for variables):
   terragrunt plan
3. Apply:
   terragrunt apply
4. Destroy:
   terragrunt destroy

Required prompted variables:
- subscription_id
- hub_vnet_name
- vnet1_name, vnet2_name, vnet3_name

## Next Improvements (optional)
- Remote backend (Azure storage) for state
- Dynamically sized spokes via for_each
- Tagging & naming standards module
- Parent root terragrunt.hcl with generate blocks

## License
MIT
