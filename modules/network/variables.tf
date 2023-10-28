

variable "network_name" {
  type    = string
  default = "ext-net-154"
}

variable "static_ip" {
  type = string
  default = ""
}

variable "want_subnet" {
  description = "If want spec subnet set up to true"
  type        = bool
  default     = false
}

variable "subnet_cidr" {
  type      = string
  default  = ""
}
