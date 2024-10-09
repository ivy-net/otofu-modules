provider "google" {
  project = var.project
  region  = var.region
}

run "plan_ok" {
  command = plan
  variables {
    name = "test"
    role = "backend"
  }
}

run "plan_wrong" {
  command = plan
  variables {
    name = "test"
    role = "broken"
  }
  expect_failures = [
    var.role,
  ]
}

run "apply" {
  command = apply
  variables {
    name = "test"
    role = "backend"
  }
  assert {
    condition     = can(output.network-id)
    error_message = "The 'network-id' output does not exist"
  }
}

run "apply_region" {
  command = apply
  variables {
    name   = "test"
    role   = "backend"
    region = "europe-west2"
  }
}
