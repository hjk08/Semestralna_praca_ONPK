
variable "flavor_name" {
  type = string
  default = "2c2r20d"
}

variable "image_name" {
  type = string
  default = locals.image.ubuntu.name
}

variable "instance_name" {
  type = string
}

variable "keypair"{
  type = string
}
