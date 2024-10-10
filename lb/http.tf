resource "google_compute_health_check" "http" {
  name               = "${var.name}-http"
  check_interval_sec = 5
  healthy_threshold  = 2
  http_health_check {
    port               = 8080
    port_specification = "USE_FIXED_PORT"
    proxy_header       = "NONE"
    request_path       = "/health"
  }
  project             = var.project
  timeout_sec         = 5
  unhealthy_threshold = 2
}

resource "google_compute_backend_service" "http" {
  name = "${var.name}-http"
  backend {
    group           = var.vm-group-id
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
  connection_draining_timeout_sec = 0
  health_checks                   = [google_compute_health_check.http.id]
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  port_name                       = "http"
  project                         = var.project
  protocol                        = "HTTP"
  session_affinity                = "NONE"
  timeout_sec                     = 30
}

# This seems to be a name for loadbalacner
resource "google_compute_url_map" "http" {
  name            = "${var.name}-http"
  default_service = google_compute_backend_service.http.id
  project         = var.project
}

resource "google_compute_target_https_proxy" "http" {
  name             = "${var.name}-http"
  project          = var.project
  ssl_certificates = [google_compute_managed_ssl_certificate.this.id]
  url_map          = google_compute_url_map.http.id
}

resource "google_compute_global_forwarding_rule" "http" {
  name                  = "${var.name}-http"
  ip_address            = google_compute_global_address.this.id
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "443"
  project               = var.project
  target                = google_compute_target_https_proxy.http.id
}
