provider "google" {}

run "setup_plan" {
  command = plan
  module {
    source = "./tests/setup"
  }
}

run "setup" {
  module {
    source = "./tests/setup"
  }
}


run "plan_not_net" {
  command = plan
  variables {
    name            = "test"
    network-name    = run.setup.net-name
    private-network = false
  }
}

run "plan_full" {
  command = plan
  variables {
    name         = "test"
    network-name = run.setup.net-name
  }
}

run "apply_simple" {
  command = apply
  variables {
    name                = "test"
    network-name        = run.setup.net-name
    deletion-protection = false
    db-size             = "db-g1-small"
    db-version          = "POSTGRES_15"
    private-network     = false
  }
}

run "apply_private" {
  command = apply
  variables {
    name                = "test2"
    network-name        = run.setup.net-name
    deletion-protection = false
    private-network     = true
    network-id          = run.setup.net-id
  }
}
