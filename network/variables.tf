variable "name" {
  description = "Name of the network"
  type        = string
}

variable "project" {
  default     = "ivynet-tests"
  description = "Name of the GCP project"
  type        = string
}

variable "region" {
  default     = "us-central1"
  description = "Name of the region"
  type        = string
}

variable "role" {
  default     = "backend"
  description = "Network role"
  type        = string
  validation {
    condition     = contains(["backend"], var.role)
    error_message = "Wrong role provided. Check variables.tf what roles are allowed"
  }
}
