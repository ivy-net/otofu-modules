provider "google" {}

mock_provider "google" {
  alias = "fake"
}

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

run "plan_ok" {
  command = plan
  variables {
    name               = "test44"
    network-id         = run.setup.net
    network-subnet-id  = run.setup.back-id
    network-proxy-cidr = run.setup.proxy-cidr
  }
}

run "apply" {
  command = apply
  variables {
    name               = "test44"
    network-id         = run.setup.net
    network-subnet-id  = run.setup.back-id
    network-proxy-cidr = run.setup.proxy-cidr
  }
}

run "apply_sa" {
  command = apply
  variables {
    name               = "test51"
    network-id         = run.setup.net
    network-subnet-id  = run.setup.back-id
    network-proxy-cidr = run.setup.proxy-cidr
    sa-email           = run.setup.sa-email
  }
}
