resource "google_sql_database" "this" {
  name            = var.name
  deletion_policy = "ABANDON"
  instance        = google_sql_database_instance.this.name
  project         = var.project
}

resource "google_sql_database_instance" "this" {
  name                = var.name
  database_version    = var.db-version
  deletion_protection = var.deletion-protection
  project             = var.project
  region              = var.region
  settings {
    tier = var.db-size
    dynamic "ip_configuration" {
      for_each = var.private-network ? [1] : []
      content {
        ipv4_enabled    = false
        private_network = var.network-id
      }
    }
    dynamic "backup_configuration" {
      for_each = var.backup ? [1] : []
      content {
        enabled                        = true
        point_in_time_recovery_enabled = true
      }
    }
  }
  depends_on = [google_service_networking_connection.this]
}

resource "google_sql_user" "this" {
  name     = "postgres"
  instance = google_sql_database_instance.this.name
  host     = ""
  password = var.password
  project  = var.project
}
