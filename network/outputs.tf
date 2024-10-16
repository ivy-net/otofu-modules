output "network-id" {
  description = "ID of the network"
  value       = google_compute_network.this.id
}

output "network-link" {
  description = "Network self-link"
  value       = google_compute_network.this.self_link
}

output "network-name" {
  description = "Network name"
  value       = google_compute_network.this.name
}

output "subnet-cidr-proxy" {
  description = "CIDR of the proxy subnet"
  value       = google_compute_subnetwork.backend.ip_cidr_range
}

output "subnet-id-backend" {
  description = "ID of the backend subnet"
  value       = google_compute_subnetwork.backend.id
}

output "subnet-id-proxy" {
  description = "ID of the proxy subnet"
  value       = google_compute_subnetwork.backend.id
}
