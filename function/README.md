# Overview

This module is for a function.

# Versions
- function-1 - initial function

# TF Docs
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.7.0 |
| <a name="provider_google"></a> [google](#provider\_google) | 6.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_service_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_member) | resource |
| [google_cloudfunctions2_function.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function) | resource |
| [google_eventarc_trigger.storage_deleted](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_trigger) | resource |
| [google_eventarc_trigger.storage_finalized](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_trigger) | resource |
| [google_project_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_storage_bucket.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_object.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [archive_file.this](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The function description | `string` | `"A simple function"` | no |
| <a name="input_entrypoint"></a> [entrypoint](#input\_entrypoint) | The function entry point | `string` | `"hello_gcs"` | no |
| <a name="input_member"></a> [member](#input\_member) | Members of IAM role | `string` | `"allAuthenticatedUsers"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the function | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | Path to directory with the function | `string` | `"function"` | no |
| <a name="input_project"></a> [project](#input\_project) | Name of the GCP project | `string` | `"ivynet-tests"` | no |
| <a name="input_region"></a> [region](#input\_region) | Name of the region | `string` | `"us-central1"` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Runtime (Programing Languge) | `string` | `"python312"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_uri"></a> [function\_uri](#output\_function\_uri) | n/a |
<!-- END_TF_DOCS -->
