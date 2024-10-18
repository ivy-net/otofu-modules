provider "google" {}

run "standalone_plan" {
  command = plan
  module {
    source = "./tests/standalone"
  }
}

run "setup1" {
  module {
    source = "./tests/standalone"
  }
}

run "plan_standalone" {
  command = plan
  variables {
    name                = run.setup1.name
    deletion-protection = false
    db-size             = "db-g1-small"
    db-version          = "POSTGRES_15"
    network-id          = run.setup1.net-id
    network-name        = run.setup1.net-name
    private-network     = false
  }
}

run "apply_standalone" {
  command = apply
  variables {
    name                = run.setup1.name
    deletion-protection = false
    db-size             = "db-g1-small"
    db-version          = "POSTGRES_15"
    network-id          = run.setup1.net-id
    network-name        = run.setup1.net-name
    private-network     = false
  }
}

run "setup2" {
  module {
    source = "./tests/private"
  }
}

run "plan_private" {
  command = plan
  variables {
    name                = run.setup2.name
    deletion-protection = false
    network-id          = run.setup2.net-id
    network-name        = run.setup2.net-name
    private-network     = true
  }
}

run "apply_private" {
  command = apply
  variables {
    name                = run.setup2.name
    deletion-protection = false
    network-id          = run.setup2.net-id
    network-name        = run.setup2.net-name
    private-network     = true
  }
}

run "apply_go_public" {
  command = apply
  variables {
    name                = run.setup2.name
    deletion-protection = false
    network-id          = run.setup2.net-id
    network-name        = run.setup2.net-name
    private-network     = false
  }
}
