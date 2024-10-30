locals {
  dns_record = "${var.name}.${var.dns_domain}"
}

resource "google_dns_record_set" "this" {
  name         = local.dns_record
  managed_zone = var.dns_zone
  project      = var.project
  rrdatas      = [google_compute_global_forwarding_rule.http.ip_address]
  type         = "A"
  ttl          = 300
}

resource "google_compute_global_address" "this" {
  name    = var.name
  project = var.project
}

resource "google_compute_managed_ssl_certificate" "this" {
  name    = var.name
  project = var.project
  managed {
    domains = [local.dns_record]
  }
}
