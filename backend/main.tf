data "google_compute_image" "this" {
  family  = "ivynet-backend"
  project = var.project
}

resource "google_compute_instance" "this" {
  name = var.name
  boot_disk {
    initialize_params {
      image = data.google_compute_image.this.self_link
    }
  }
  labels = {
    creator = "terraform"
    area    = "backend"
  }
  machine_type = var.vm-size
  network_interface {
    network    = var.network-id
    subnetwork = var.network-subnet-id
    access_config {}
  }
  project = var.project
  service_account {
    email  = var.sa-email
    scopes = ["cloud-platform"]
  }
  tags = [
    "ivynet-backend",
    "ssh"
  ]
  zone = "${var.region}-${var.region_zone}"
}

resource "google_compute_instance_group" "this" {
  name        = var.name
  description = "Instance Group with Backend VM"
  instances = [
    google_compute_instance.this.id,
  ]
  named_port {
    name = "http"
    port = "8080"
  }
  named_port {
    name = "grpc"
    port = "50050"
  }
  project = var.project
  zone    = "${var.region}-${var.region_zone}"
}
