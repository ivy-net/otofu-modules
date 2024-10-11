module "network" {
  source = "../../../network"
  name   = "test44"
}

module "vm" {
  source             = "../../../backend"
  name               = "test44"
  network-id         = module.network.network-id
  network-subnet-id  = module.network.subnet-id-backend
  network-proxy-cidr = module.network.subnet-cidr-proxy
}

output "back-id" {
  value = module.network.subnet-id-backend
}

output "backend-id" {
  value = module.vm.backend-group-id
}

output "net" {
  value = module.network.network-id
}

output "net-link" {
  value = module.network.network-link
}
