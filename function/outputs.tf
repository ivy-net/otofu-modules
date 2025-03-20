output "function_uri" {
  value = google_cloudfunctions2_function.this.service_config[0].uri
}
