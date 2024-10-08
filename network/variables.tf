variable "name" {
  description = "Name of the network"
  type = string
}

variable "project" {
  description = "Name of the GCP project"
  default = "ivynet-tests"
  type = string
}

variable "region" {
  description = "GCP region"
  default = "us-central"
  type = string
}

variable "role" {
  description = "Network role"
  default = "backend"
  type = string
  validation {
    condition     = contains(["backend"], var.role)
    error_message = "Wrong role provided. Check variables.tf what roles are allowed"
  }
}
