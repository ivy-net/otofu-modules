variable "availability" {
  default     = "ZONAL"
  description = "Type of availability (normal=ZONAL, HA=REGIONAL)"
  type        = string
  validation {
    condition     = contains(["ZONAL", "REGIONAL"], var.availability)
    error_message = "It has to be 'ZONAL' or 'REGIONAL'"
  }
}

variable "backup" {
  default     = true
  description = "Switch to enable backups"
  type        = bool
}

variable "db-size" {
  default     = "db-f1-micro"
  description = "DB size/type"
  type        = string
}

variable "db-version" {
  default     = "POSTGRES_14"
  description = "DB type and version (e.g. POSTGRES_14)"
  type        = string
}
variable "deletion-protection" {
  default     = true
  description = "Delete protection of DB"
  type        = bool
}

variable "name" {
  description = "Name of the DB"
  type        = string
}

variable "network-id" {
  description = "ID of the network"
  type        = string
}

variable "network-name" {
  description = "Name for the network"
  type        = string
}

variable "password" {
  default     = "ivy5TAYSthe5AME"
  description = "Password for the postgres user"
  type        = string
  sensitive   = true
}

variable "project" {
  default     = "ivynet-tests"
  description = "Name of the GCP project"
  type        = string
}

variable "private-network" {
  default     = true
  description = "Switch to connect to a private network"
  type        = bool
}

variable "region" {
  default     = "us-central1"
  description = "Name of the region"
  type        = string
}
