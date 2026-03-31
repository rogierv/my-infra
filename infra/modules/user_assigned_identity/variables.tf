variable "prefix" {
  description = "Short prefix used for resource naming (e.g. owner initials)."
  type        = string
}

variable "name" {
  description = "Short name for the identity, used to distinguish multiple instances (e.g. 'func-api', 'func-worker')."
  type        = string
}

variable "env" {
  description = "Environment name (e.g. dev, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the identity is deployed."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group where the identity is deployed."
  type        = string
}
