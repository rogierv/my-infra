variable "prefix" {
  description = "Short prefix used for resource naming (e.g. owner initials)."
  type        = string
}

variable "env" {
  description = "Environment name (e.g. dev, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where Key Vault is deployed."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group where Key Vault is deployed."
  type        = string
}

variable "sku_name" {
  description = "SKU of the Key Vault. Allowed values: standard, premium."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "sku_name must be either 'standard' or 'premium'."
  }
}

variable "soft_delete_retention_days" {
  description = "Number of days that soft-deleted keys, secrets, and certificates are retained. Must be between 7 and 90."
  type        = number
  default     = 7

  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90
    error_message = "soft_delete_retention_days must be between 7 and 90."
  }
}

variable "purge_protection_enabled" {
  description = "Whether purge protection is enabled on the Key Vault."
  type        = bool
  default     = false
}
