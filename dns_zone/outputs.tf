output "dns_zone" {
  description = "the name of the DNS Zone"
  value       = google_dns_managed_zone.this.dns_name
}
