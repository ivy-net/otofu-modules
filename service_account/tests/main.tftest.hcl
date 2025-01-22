provider "google" {}

run "plan_ok" {
  command = plan
  variables {
    name         = "satest"
    display_name = "Tofu Test of SA"
    roles = [
      "roles/logging.logWriter",
      "roles/monitoring.metricWriter"
    ]
  }
}

run "apply" {
  command = apply
  variables {
    name         = "satest"
    display_name = "Tofu Test of SA"
    roles = [
      "roles/logging.logWriter",
      "roles/monitoring.metricWriter"
    ]
  }
}
