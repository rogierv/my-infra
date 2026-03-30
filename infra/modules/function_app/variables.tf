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

variable "sku_name" {
  description = "SKU of the service plan. Use FC1 for Flex Consumption, Y1 for consumption, EP1/EP2/EP3 for elastic premium. Ignored when service_plan_id is set."
  type        = string
  default     = "FC1"
}

variable "service_plan_id" {
  description = "ID of an existing service plan to reuse. When set, no new service plan is created and sku_name is ignored."
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "Name of the storage account used by the function app."
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
  description = "Runtime language for the function app. Allowed values: dotnet, python, node, java, powershell."
  type        = string

  validation {
    condition     = contains(["dotnet", "python", "node", "java", "powershell"], var.runtime_name)
    error_message = "runtime_name must be one of: dotnet, python, node, java, powershell."
  }
}

variable "runtime_version" {
  description = "Version of the runtime (e.g. '8.0' for dotnet, '3.11' for python, '20' for node, '17' for java, '7.4' for powershell)."
  type        = string
}

variable "dotnet_isolated" {
  description = "Whether to use the dotnet isolated worker model. Only applies when runtime_name is 'dotnet'."
  type        = bool
  default     = true
}
