resource "google_compute_health_check" "grpc" {
  name               = "${var.name}-grpc"
  check_interval_sec = 5
  healthy_threshold  = 2
  http2_health_check {
    port               = 50050
    port_specification = "USE_FIXED_PORT"
  }
  project             = var.project
  timeout_sec         = 5
  unhealthy_threshold = 2
}

resource "google_compute_backend_service" "grpc" {
  name = "${var.name}-grpc"
  backend {
    group           = var.vm-group-id
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
    max_utilization = 0.8
  }
  connection_draining_timeout_sec = 0
  health_checks                   = [google_compute_health_check.grpc.id]
  load_balancing_scheme           = "EXTERNAL"
  /*   log_config {
    enable = true
  }*/
  port_name        = "grpc"
  project          = var.project
  protocol         = "HTTP2"
  session_affinity = "NONE"
  timeout_sec      = 30
}

resource "google_compute_url_map" "grpc" {
  name            = "${var.name}-grpc"
  default_service = google_compute_backend_service.grpc.id
  project         = var.project
}

resource "google_compute_target_https_proxy" "grpc" {
  name             = "${var.name}-grpc"
  project          = var.project
  quic_override    = "DISABLE"
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
  url_map          = google_compute_url_map.grpc.id
}

resource "google_compute_global_forwarding_rule" "grpc" {
  name                  = "${var.name}-grpc"
  ip_address            = google_compute_global_address.this.id
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "50050"
  project               = var.project
  target                = google_compute_target_https_proxy.grpc.id
}
