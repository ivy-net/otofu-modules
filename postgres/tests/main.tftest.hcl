provider "google" {}

run "plan_ok" {
  command = plan
  variables {
    name = "test"
  }
}

run "plan_wrong" {
  command = plan
  variables {
    name = "test"
  }
}

run "apply_simple" {
  command = apply
  variables {
    name                = "test"
    deletion_protection = false
  }
}

run "apply_region" {
  command = apply
  variables {
    name                = "test"
    db-size             = "db-g1-small"
    db-version          = "POSTGRES_15"
    deletion_protection = false
    region              = "northamerica-northeast1"
  }
}
