#run "setup_tests" {
#    module {
#        source = "./tests/setup"
#    }
#}

provider "google" {
  project = var.project
  region  = var.region
}

run "test_ok" {
  command = plan

  variables {
    name = "test"
    role = "backend"
  }
}

run "test_wrong" {
  command = plan

  variables {
    name = "test"
    role = "broken"
  }

  expect_failures = [
    var.role,
  ]
}
