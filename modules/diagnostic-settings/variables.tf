variable "name" {
  description = "Name of the diagnostic setting"
  type        = string
}

variable "target_resource_id" {
  description = "Resource ID of the Azure resource being monitored"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Resource ID of the destination Log Analytics Workspace"
  type        = string
}

variable "log_category_groups" {
  description = "Diagnostic log category groups to enable"
  type        = set(string)
  default     = ["allLogs"]
}

variable "metric_categories" {
  description = "Diagnostic metric categories to enable"
  type        = set(string)
  default     = []
}

variable "log_analytics_destination_type" {
  description = "Log Analytics destination mode"
  type        = string
  default     = "Dedicated"

  validation {
    condition = contains(
      ["Dedicated", "AzureDiagnostics"],
      var.log_analytics_destination_type
    )

    error_message = "The destination type must be Dedicated or AzureDiagnostics."
  }
}