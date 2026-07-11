variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}