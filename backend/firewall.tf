resource "google_compute_firewall" "ssh" {
  name = "${var.name}-allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = var.network-id
  priority      = 1000
  project       = var.project
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

resource "google_compute_firewall" "healh_check" {
  name = "${var.name}-allow-health-check"
  allow {
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = var.network-id
  priority      = 100
  project       = var.project
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["ivynet-backend"]
}

resource "google_compute_firewall" "backend_services" {
  name = "${var.name}-allow-backend-services"
  allow {
    ports    = ["8080"]
    protocol = "tcp"
  }
  allow {
    ports    = ["50050"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = var.network-id
  priority      = 200
  project       = var.project
  source_ranges = [var.network-proxy-cidr]
  target_tags   = ["ivynet-backend"]
}
