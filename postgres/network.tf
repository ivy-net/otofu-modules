resource "google_compute_global_address" "this" {
  count         = var.private-network ? 1 : 0
  name          = "${var.name}-private-ip-address"
  address_type  = "INTERNAL"
  network       = var.network-id
  prefix_length = 16
  project       = var.project
  purpose       = "VPC_PEERING"
}

resource "google_service_networking_connection" "this" {
  count                   = var.private-network ? 1 : 0
  network                 = var.network-id
  reserved_peering_ranges = [google_compute_global_address.this[0].name]
  service                 = "servicenetworking.googleapis.com"
}

resource "google_compute_network_peering_routes_config" "peering_routes" {
  count                = var.private-network ? 1 : 0
  peering              = google_service_networking_connection.this[0].peering
  project              = var.project
  network              = var.network-name
  import_custom_routes = true
  export_custom_routes = true
}
