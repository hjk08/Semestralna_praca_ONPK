# --- main.tf ---

data "http" "my_public_ip" {
  url = "http://ipv4.icanhazip.com"
}

module "jump_box" {
  source      = "github.com/hjk08/Semstralna_praca_ONPK/project/jump_box" 
}

module "instance1" {
  source                = "github.com/hjk08/Semstralna_praca_ONPK/modules/compute"
  instance_name         = "private_server"
  sec_group_name        = "server_sec_gr"
  static_ip             = "10.10.10.43"
  keypair               = module.jump_box.keypair_name
  my_public_ip          = data.http.my_public_ip.response_body
  private_network_name  = module.jump_box.private_network_name
}