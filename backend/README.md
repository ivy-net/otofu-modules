# Overview

This module a backend VM and instance group based on it.

# Versions
- backend-1 - initial backend vm

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
| [google_compute_firewall.backend_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.healh_check](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_instance_group.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group) | resource |
| [google_compute_image.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | Zone for DNS and SSL | `string` | `"test.ivynet.dev."` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the VM (and instance group) | `string` | n/a | yes |
| <a name="input_network-id"></a> [network-id](#input\_network-id) | The ID of the network to add VM to | `string` | n/a | yes |
| <a name="input_network-proxy-cidr"></a> [network-proxy-cidr](#input\_network-proxy-cidr) | The CIDR range of the proxy (load balancer) | `string` | n/a | yes |
| <a name="input_network-subnet-id"></a> [network-subnet-id](#input\_network-subnet-id) | The ID of the subnet toadd VM to | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of the GCP project | `string` | `"ivynet-tests"` | no |
| <a name="input_region"></a> [region](#input\_region) | Name of the region | `string` | `"us-central1"` | no |
| <a name="input_region_zone"></a> [region\_zone](#input\_region\_zone) | Letter for the zone (by default based on the region) | `string` | `"c"` | no |
| <a name="input_vm-type"></a> [vm-type](#input\_vm-type) | VM size/type | `string` | `"n2-standard-2"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
