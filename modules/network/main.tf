# --- network/main.tf --

resource "openstack_networking_network_v2" "network" {
    name            = var.private_network_name
    admin_state_up  = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  network_id  = openstack_networking_network_v2.network.id
  cidr        = var.subnet_cidr
}

data "openstack_networking_network_v2" "public_network" {
  count   = var.want_public_network ? 1 : 0
  name    = var.public_network_name
}

