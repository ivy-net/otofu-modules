
data "archive_file" "this" {
  type        = "zip"
  output_path = "/tmp/function-source.zip"
  source_dir  = var.path
}

resource "google_storage_bucket" "this" {
  name                        = "ivynet-${var.name}"
  location                    = "US"
  project                     = var.project
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "this" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.this.name
  source = data.archive_file.this.output_path
}

resource "google_cloudfunctions2_function" "this" {
  name        = var.name
  description = var.description
  build_config {
    entry_point = var.entrypoint
    runtime     = var.runtime
    source {
      storage_source {
        bucket = google_storage_bucket.this.name
        object = google_storage_bucket_object.this.name
      }
    }
  }
  location = var.region
  project  = var.project
  service_config {
    available_memory   = "256M"
    max_instance_count = 1
    timeout_seconds    = 60
  }
}

resource "google_eventarc_trigger" "storage_deleted" {
  name = "client-copy-deleted"
  destination {
    cloud_run_service {
      service = google_cloudfunctions2_function.this.name
      region  = google_cloudfunctions2_function.this.location
    }
  }
  location = "us"
  matching_criteria {
    attribute = "type"
    value     = "google.cloud.storage.object.v1.deleted"
  }
  matching_criteria {
    attribute = "bucket"
    value     = "ivynet-share"
  }
  project         = var.project
  service_account = google_service_account.this.email
}

resource "google_eventarc_trigger" "storage_finalized" {
  name = "client-copy-finalized"
  destination {
    cloud_run_service {
      service = google_cloudfunctions2_function.this.name
      region  = google_cloudfunctions2_function.this.location
    }
  }
  location = "us"
  matching_criteria {
    attribute = "type"
    value     = "google.cloud.storage.object.v1.finalized"
  }
  matching_criteria {
    attribute = "bucket"
    value     = "ivynet-share"
  }
  project         = var.project
  service_account = google_service_account.this.email
}

resource "google_cloud_run_service_iam_member" "this" {
  location = google_cloudfunctions2_function.this.location
  member   = "serviceAccount:${google_service_account.this.email}"
  project  = var.project
  role     = "roles/run.invoker"
  service  = google_cloudfunctions2_function.this.name
}

resource "google_project_iam_member" "this" {
  for_each = toset([
    "roles/eventarc.eventReceiver",
    "roles/eventarc.serviceAgent"
  ])
  member  = "serviceAccount:${google_service_account.this.email}"
  project = var.project
  role    = each.key
}

resource "google_service_account_iam_member" "this" {
  service_account_id = google_service_account.this.name
  member             = "serviceAccount:${google_service_account.this.email}"
  role               = "roles/iam.serviceAccountUser"
}

resource "google_service_account" "this" {
  account_id   = "test-fun-trigger"
  display_name = "SA for trigger for Test Function"
  project      = var.project
}
