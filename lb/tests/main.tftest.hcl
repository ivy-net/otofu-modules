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

run "plan_ok" {
  command = plan
  variables {
    name               = "test44"
    dns_zone           = run.setup.dns_name
    dns_domain         = run.setup.dns_domain
    network-id         = run.setup.net
    network-subnet-id  = run.setup.back-id
    network-proxy-cidr = run.setup.proxy-cidr
    vm-group-id        = run.setup.backend-id
  }
}

run "apply" {
  command = apply
  variables {
    name               = "test44"
    dns_zone           = run.setup.dns_name
    dns_domain         = run.setup.dns_domain
    network-id         = run.setup.net
    network-subnet-id  = run.setup.back-id
    network-proxy-cidr = run.setup.proxy-cidr
    vm-group-id        = run.setup.backend-id
  }
}
