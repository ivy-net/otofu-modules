output "dns_zone_domain" {
  description = "the domain name"
  value       = google_dns_managed_zone.this.dns_name
}

output "dns_zone_name" {
  description = "the name of the DNS Zone"
  value       = google_dns_managed_zone.this.name
}
