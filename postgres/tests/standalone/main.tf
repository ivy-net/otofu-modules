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

output "net-id" {
  value = module.network.network-id
}

output "net-name" {
  value = module.network.network-name
}

output "name" {
  value = random_pet.name.id
}
