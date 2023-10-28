
locals {
  image = {
    ubuntu = {
      name        = "ubuntu-22.04-kis"
      os_username = "ubuntu"
    }
  }

  university = {
    network = {
      cidr = "158.193.0.0/16"
    }
  }
}