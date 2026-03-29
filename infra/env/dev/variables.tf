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

variable "developer_object_ids" {
  description = "List of Azure AD object IDs to add to the Developers group."
  type        = list(string)
  default     = []
}
