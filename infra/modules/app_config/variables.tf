variable "prefix" {
  description = "Short prefix used for resource naming (e.g. owner initials)."
  type        = string
}

variable "env" {
  description = "Environment name (e.g. dev, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where App Configuration is deployed."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group where App Configuration is deployed."
  type        = string
}

variable "sku" {
  description = "SKU of the App Configuration store. Allowed values: free, standard."
  type        = string
  default     = "free"

  validation {
    condition     = contains(["free", "standard"], var.sku)
    error_message = "sku must be either 'free' or 'standard'."
  }
}
