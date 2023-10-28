
locals {
  image = {
    debian = {
      name        = "debian-12-kis"
      os_username = "debian"
    }
  }

  university = {
    network = {
      cidr = "158.193.0.0/16"
    }
  }
}