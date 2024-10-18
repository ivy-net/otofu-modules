terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_pet" "name" {
}


module "network" {
  source = "../../../network"
  name   = random_pet.name.id
}

module "vm" {
  source             = "../../../backend"
  name               = random_pet.name.id
  network-id         = module.network.network-id
  network-subnet-id  = module.network.subnet-id-backend
  network-proxy-cidr = module.network.subnet-cidr-proxy
}

output "net-id" {
  value = module.network.network-id
}

output "net-name" {
  value = module.network.network-name
}

output "name" {
  value = random_pet.name.id
}
