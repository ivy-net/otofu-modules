
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

resource "google_cloud_run_service_iam_member" "this" {
  location = google_cloudfunctions2_function.this.location
  member   = "allUsers"
  project  = var.project
  role     = "roles/run.invoker"
  service  = google_cloudfunctions2_function.this.name
}
