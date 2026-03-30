variable "prefix" {
  description = "Short prefix used for resource naming (e.g. owner initials)."
  type        = string
}

variable "name" {
  description = "Short name for the function app, used to distinguish multiple instances (e.g. 'api', 'worker')."
  type        = string
}

variable "env" {
  description = "Environment name (e.g. dev, prod)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the function app is deployed."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group where the function app is deployed."
  type        = string
}

variable "service_plan_id" {
  description = "ID of an existing service plan to reuse. When set, no new service plan is created."
  type        = string
  default     = null
}

variable "storage_account_id" {
  description = "ID of the storage account used by the function app."
  type        = string
}

variable "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint of the storage account used by the function app."
  type        = string
}

variable "storage_account_access_key" {
  description = "Primary access key of the storage account used by the function app."
  type        = string
  sensitive   = true
}

variable "app_insights_connection_string" {
  description = "Application Insights connection string for telemetry. Set to null to disable."
  type        = string
  default     = null
  sensitive   = true
}

variable "runtime_name" {
  description = "Runtime language for the function app. Allowed values: dotnet-isolated, python, node, java, powershell, custom."
  type        = string

  validation {
    condition     = contains(["dotnet-isolated", "python", "node", "java", "powershell", "custom"], var.runtime_name)
    error_message = "runtime_name must be one of: dotnet-isolated, python, node, java, powershell, custom."
  }
}

variable "runtime_version" {
  description = "Version of the runtime (e.g. '8.0' for dotnet-isolated, '3.11' for python, '20' for node, '17' for java, '7.4' for powershell)."
  type        = string
}

variable "instance_memory_in_mb" {
  description = "Memory allocated per instance in MB. Allowed values: 512, 2048."
  type        = number
  default     = 512

  validation {
    condition     = contains([512, 2048], var.instance_memory_in_mb)
    error_message = "instance_memory_in_mb must be either 512 or 2048."
  }
}
