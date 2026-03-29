variable "prefix" {
  description = "Short prefix used for resource naming."
  type        = string
}

variable "env" {
  description = "Environment name."
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
}
