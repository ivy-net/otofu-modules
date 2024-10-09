module "network" {
  source = "../../../network"
  name   = "test44"
}

output "net" {
  value = module.network.network-id
}

output "back" {
  value = module.network.subnet-backend
}

output "proxy" {
  value = module.network.subnet-proxy
}
