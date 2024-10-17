# Overview

This module provides a DB (Postgres) mostly for backend.

# Versions
- postgres-1 - basic module for backend

# TF Docs
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_global_address.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_network_peering_routes_config.peering_routes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering_routes_config) | resource |
| [google_service_networking_connection.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |
| [google_sql_database.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability"></a> [availability](#input\_availability) | Type of availability (normal=ZONAL, HA=REGIONAL) | `string` | `"ZONAL"` | no |
| <a name="input_backup"></a> [backup](#input\_backup) | Switch to enable backups | `bool` | `true` | no |
| <a name="input_db-size"></a> [db-size](#input\_db-size) | DB size/type | `string` | `"db-f1-micro"` | no |
| <a name="input_db-version"></a> [db-version](#input\_db-version) | DB type and version (e.g. POSTGRES\_14) | `string` | `"POSTGRES_14"` | no |
| <a name="input_deletion-protection"></a> [deletion-protection](#input\_deletion-protection) | Delete protection of DB | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the DB | `string` | n/a | yes |
| <a name="input_network-id"></a> [network-id](#input\_network-id) | ID of the network | `string` | n/a | yes |
| <a name="input_network-name"></a> [network-name](#input\_network-name) | Name for the network | `string` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Password for the postgres user | `string` | `"ivy5TAYSthe5AME"` | no |
| <a name="input_private-network"></a> [private-network](#input\_private-network) | Switch to connect to a private network | `bool` | `true` | no |
| <a name="input_project"></a> [project](#input\_project) | Name of the GCP project | `string` | `"ivynet-tests"` | no |
| <a name="input_region"></a> [region](#input\_region) | Name of the region | `string` | `"us-central1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip"></a> [ip](#output\_ip) | DB IP address |
<!-- END_TF_DOCS -->
