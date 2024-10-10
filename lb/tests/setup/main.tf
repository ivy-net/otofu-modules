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

module "dns" {
  source   = "../../../dns_zone"
  name     = "test44"
  dns_zone = "44.ivynet.dev."
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

output "backend-id" {
  value = module.vm.backend-group-id
}

output "dns_name" {
  value = module.dns.dns_zone_name
}

output "dns_domain" {
  value = module.dns.dns_zone_domain
}
