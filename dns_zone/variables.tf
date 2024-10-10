variable "dns_zone" {
  description = "DNS Zone to add"
  type        = string
}

variable "name" {
  description = "Name for the DNS Zone"
  type        = string
}

variable "project" {
  default     = "ivynet-tests"
  description = "Name of the GCP project"
  type        = string
}
