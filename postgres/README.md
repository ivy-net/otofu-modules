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
| <a name="provider_google"></a> [google](#provider\_google) | 6.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_sql_database.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db-size"></a> [db-size](#input\_db-size) | DB size/type | `string` | `"db-f1-micro"` | no |
| <a name="input_db-version"></a> [db-version](#input\_db-version) | DB type and version (e.g. POSTGRES\_14) | `string` | `"POSTGRES_14"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Delete protection of DB | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the network | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of the GCP project | `string` | `"ivynet-tests"` | no |
| <a name="input_region"></a> [region](#input\_region) | Name of the region | `string` | `"us-central1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
