variable "name" {
  description = "The name/ID of the SA"
  type        = string
}

variable "display_name" {
  description = "The display name for the account"
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

variable "roles" {
  description = "List of IAM roles to add to SA"
  type        = list(string)
}
