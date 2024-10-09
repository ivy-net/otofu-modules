variable "dns_zone" {
  default     = "test.ivynet.dev."
  description = "Zone for DNS and SSL"
  type        = string
}

variable "name" {
  description = "The name of the VM (and instance group)"
  type        = string
}

variable "network-id" {
  description = "The ID of the network to add VM to"
  type        = string
}

variable "network-subnet-id" {
  description = "The ID of the subnet toadd VM to"
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

variable "region_zone" {
  default     = "c"
  description = "Letter for the zone (by default based on the region)"
  type        = string
}

variable "vm-type" {
  default     = "n2-standard-2"
  description = "VM size/type"
  type        = string
}
