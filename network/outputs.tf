output "network-id" {
  description = "ID of the network"
  value       = google_compute_network.this.id
}

output "subnet-backend" {
  description = "ID of the backend subnet"
  value       = google_compute_subnetwork.backend.id
}

output "subnet-proxy" {
  description = "ID of the backend subnet"
  value       = google_compute_subnetwork.backend.id
}
