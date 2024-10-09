# Overview

This module provides a GCP network.
It 'hardcoded' for limited number of usages.
At the moment it's only a network for the backend.

# Versions
- network-2 - add outputs; reorg project & region vars setup
- network-1 - initial network, only for backend

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
| [google_compute_network.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.backend](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_compute_subnetwork.proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the network | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of the GCP project | `string` | `"ivynet-tests"` | no |
| <a name="input_region"></a> [region](#input\_region) | Name of the region | `string` | `"us-central1"` | no |
| <a name="input_role"></a> [role](#input\_role) | Network role | `string` | `"backend"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network-id"></a> [network-id](#output\_network-id) | ID of the network |
| <a name="output_subnet-backend"></a> [subnet-backend](#output\_subnet-backend) | ID of the backend subnet |
| <a name="output_subnet-proxy"></a> [subnet-proxy](#output\_subnet-proxy) | ID of the backend subnet |
<!-- END_TF_DOCS -->
