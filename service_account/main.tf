locals {
  roles = var.roles
}

resource "google_service_account" "this" {
  account_id   = var.name
  display_name = var.display_name
  project      = var.project
}

resource "google_project_iam_member" "this" {
  for_each = toset(local.roles)
  member   = "serviceAccount:${google_service_account.this.email}"
  project  = var.project
  role     = each.value
}
