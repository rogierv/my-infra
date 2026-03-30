variable "prefix" {
  description = "Short prefix used for resource naming (e.g. owner initials)."
  type        = string
}

variable "name" {
  description = "Short name for the storage account, used to distinguish multiple instances (e.g. 'app', 'backup')."
  type        = string
}

variable "env" {
  description = "Environment name (e.g. dev, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account is deployed."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group where the storage account is deployed."
  type        = string
}

variable "account_tier" {
  description = "Tier of the storage account. Allowed values: Standard, Premium."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "account_tier must be either 'Standard' or 'Premium'."
  }
}

variable "account_replication_type" {
  description = "Replication type of the storage account. Allowed values: LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  type        = string
  default     = "LRS"

  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "account_replication_type must be one of: LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  }
}
