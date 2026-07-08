locals {

  # Environment
  environment = "prod"

  # Azure Region
  location    = "Australia East"
  region_code = "aue"

  # Common Tags
  tags = {
    ManagedBy   = "Terraform"
    Environment = "Production"
    Project     = "Azure Landing Zone"
    Owner       = "CAP10"
    CostCentre  = "IT"
  }

}