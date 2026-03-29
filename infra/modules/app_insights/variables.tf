variable "prefix" {
  description = "Short prefix used for resource naming (e.g. owner initials)."
  type        = string
}

variable "env" {
  description = "Environment name (e.g. dev, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the existing resource group where App Insights is deployed."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the existing resource group where App Insights is deployed."
  type        = string
}
