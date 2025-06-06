variable "location" { 
  description = "Azure region for resource deployment"
  type        = string
  default     = "eastus"
}

variable "admin_password" {
  description = "The admin password"
  type        = string
  sensitive   = true
}

variable "prefix" {
  description = "Prefix for all resources"
  type        = string
  default     = "practice"
}
