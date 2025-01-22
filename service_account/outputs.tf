output "email" {
  description = "Email for SA"
  value       = google_service_account.this.email
}
