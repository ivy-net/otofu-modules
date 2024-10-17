terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_pet" "name1" {
}

resource "random_pet" "name2" {
}

module "network" {
  source = "../../../network"
  name   = random_pet.name1.id
}

module "vm" {
  source             = "../../../backend"
  name               = random_pet.name1.id
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

output "net-id" {
  value = module.network.network-id
}

output "net-name" {
  value = module.network.network-name
}

output "net-link" {
  value = module.network.network-link
}

output "name1" {
  value = random_pet.name1.id
}

output "name2" {
  value = random_pet.name2.id
}
