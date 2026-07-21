locals {
  location    = "Australia East"
  region_code = "aue"

  tags = {
    Organisation       = var.organisation
    Department         = var.department
    Application        = var.application_name
    Environment        = var.environment
    Owner              = var.owner
    SupportTeam        = var.support_team
    CostCentre         = var.cost_centre
    DataClassification = var.data_classification
    Criticality        = var.criticality
    ManagedBy          = "Terraform"
    IaC                = "Terraform"
  }
}