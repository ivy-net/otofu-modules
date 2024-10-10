module "network" {
  source = "../../../network"
  name   = "test44"
}

output "net" {
  value = module.network.network-id
}

output "back-id" {
  value = module.network.subnet-id-backend
}

output "proxy-cidr" {
  value = module.network.subnet-cidr-proxy
}
