provider "google" {}

run "plan_ok" {
  command = plan
  variables {
    name     = "tofutest"
    dns_zone = "waw.ivynet.dev."
  }
}

run "apply" {
  command = apply
  variables {
    name     = "tofutest"
    dns_zone = "waw.ivynet.dev."
  }
}
