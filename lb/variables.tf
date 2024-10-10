variable "dns_domain" {
  description = "Domain Name used for FQDN of LB"
  type        = string
}

variable "dns_zone" {
  description = "The name of the DNS ZONE"
  type        = string
}

variable "name" {
  description = "Name of the loadbalancer"
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

variable "vm-group-id" {
  description = "ID of the backend instance group"
  type        = string
}
