provider "google" {}

run "plan_ok" {
  command = plan
  variables {
    name        = "funtest-wawrzek"
    description = "Tofu Test of SA"
    entrypoint  = "helloHTTP"
    path        = "tests/nodejs-docs-samples/functions/helloworld/helloworldHttp"
    runtime     = "nodejs22"
    region      = "us-west1"
  }
}

run "apply" {
  command = apply
  variables {
    name        = "funtest-wawrzek"
    description = "Tofu Test of SA"
    entrypoint  = "helloHttp"
    path        = "tests/nodejs-docs-samples/functions/helloworld/helloworldHttp"
    runtime     = "nodejs22"
  }
}
