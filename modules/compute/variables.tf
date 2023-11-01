
variable "flavor_name" {
  type = string
  default = "2c4r64d"
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

variable "private_network_name" {
  type = string
}

variable "public_network_name"{
  type = string
  default = ""
}

variable "static_ip" {
  type = string
}

variable "want_public_inteface" {
  type = bool
  default = false
}

variable "user_data" {
  type = string
}