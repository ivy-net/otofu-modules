variable "description" {
  default     = "A simple function"
  description = "The function description"
  type        = string
}

variable "entrypoint" {
  default     = "hello_gcs"
  description = "The function entry point"
  type        = string
}

variable "member" {
  default     = "allAuthenticatedUsers"
  description = "Members of IAM role"
  type        = string
}

variable "name" {
  description = "Name for the function"
  type        = string
}
variable "path" {
  default     = "function"
  description = "Path to directory with the function"
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

variable "runtime" {
  default     = "python312"
  description = "Runtime (Programing Languge)"
  type        = string
}
