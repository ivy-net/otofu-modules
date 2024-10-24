# Overview

This module creates a DNS ZONE in GCP.

# Versions
- dns_zone-1 - initial version of dns_zone

# TF Docs
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_dns_managed_zone.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | DNS Zone to add | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name for the DNS Zone | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of the GCP project | `string` | `"ivynet-tests"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_zone_domain"></a> [dns\_zone\_domain](#output\_dns\_zone\_domain) | the domain name |
| <a name="output_dns_zone_name"></a> [dns\_zone\_name](#output\_dns\_zone\_name) | the name of the DNS Zone |
<!-- END_TF_DOCS -->
