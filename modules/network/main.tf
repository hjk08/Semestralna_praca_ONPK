# --- network/main.tf --

resource "openstack_networking_network_v2" "network" {
    name = var.network_name
    admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  count      = var.want_subnet ? 1 : 0
  network_id = openstack_networking_network_v2.network.id
  cidr = var.subnet_cidr
}

