

variable "public_network_name" {
  type    = string
  default = "ext-net-154"
}

variable "private_network_name" {
  type    = string
}

variable "subnet_cidr" {
  type      = string
}

variable "want_public_network" {
  type = bool
  default = false
}
