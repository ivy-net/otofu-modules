module "network" {
  source = "../../../network"
  name   = "test44"
}

module "sa" {
  source       = "../../../service_account"
  name         = "test44"
  display_name = "SA for tofu backend test"
  roles = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter"
  ]
}

output "back-id" {
  value = module.network.subnet-id-backend
}

output "net" {
  value = module.network.network-id
}

output "proxy-cidr" {
  value = module.network.subnet-cidr-proxy
}

output "sa-email" {
  value = module.sa.email
}
