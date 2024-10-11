resource "google_sql_database" "this" {
  name            = var.name
  deletion_policy = "ABANDON"
  instance        = google_sql_database_instance.this.name
  project         = var.project
}

resource "google_sql_database_instance" "this" {
  name                = var.name
  database_version    = var.db-version
  deletion_protection = var.deletion_protection
  project             = var.project
  region              = var.region
  settings {
    tier = var.db-size
  }
}
