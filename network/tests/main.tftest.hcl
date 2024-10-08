#run "setup_tests" {
#    module {
#        source = "./tests/setup"
#    }
#}

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
    role = "broken"
  }
}

run "apply_region" {
  command = apply
  variables {
    name   = "test"
    role   = "broken"
    region = "europe-west2"
  }
}
