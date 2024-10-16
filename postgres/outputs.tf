output "ip" {
  description = "DB IP address"
  value       = google_sql_database_instance.this.ip_address.0.ip_address
}
