# --- main.tf ---

data "http" "my_public_ip" {
  url = "http://ipv4.icanhazip.com"
}

resource "openstack_compute_keypair_v2" "keypair" {
  name       = "ONPK1-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEc3eVfn/wjRcWWEoZjBXiCW5lwrLh2A11fuPZcKl1GSAg5OtLSKacJXHjKGLnuJVqFPxiLT4A0OPc9A0gk8TRueNi7mfauKiHjlldcI2oF9ueMyyhBvyHtcsHftG4iUJ4Za3KvsDwXM1UdRFO17tgxXrwcYhe0T1wYIbeLvO8L+Vembec+sp81sL8UM7jjc94hve1JP6j2B91/i+s8UecZqTx5cvFHZghRk8BpsD62CWGEosbYOb9iqq29NuypJrQzScEjUnnZ2AAi9iNaebqn8ECdOOXv7NqOEVOBG0xPZtoH0DKlIUYS9uVQXLNsHIqfOIpeckVfb/fVSCEz4lr"
}

module "instance" {
  source        = "github.com/hjk08/Semstralna_praca_ONPK/modules/compute"
  //project       = local.project
  //environment   = var.environment
  //my_public_ip  = data.http.my_public_ip.response_body
  //key_pair_name = openstack_compute_keypair_v2.keypair.name
  flavor_name   = var.flavor_name
  //user_data     = data.cloudinit_config.user_data.rendered
}