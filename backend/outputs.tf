output "backend-group-id" {
  description = "ID of the Backend VM group"
  value       = google_compute_instance_group.this.id
}
