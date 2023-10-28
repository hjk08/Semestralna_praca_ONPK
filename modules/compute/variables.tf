
variable "flavor_name" {
  type = string
  default = "2c2r20d"
}

variable "instance_name" {
  type = string
}

variable "keypair"{
  type = string
}

variable "my_public_ip" {
  type = string
}

variable "sec_group_name"{
  type = string
}

variable "want_public_network" {
  type = bool
  default = false
}
