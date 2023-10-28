# --- network/main.tf --



################## sec group #############################################################################

resource "openstack_networking_secgroup_v2" "security_group" {
  name        = "ONPK_praca_sec_group"
  description = "Managed by Terraform!"
}

################## rules for sec group ####################################################################

resource "openstack_networking_secgroup_rule_v2" "security_group_rule_icmp" {
  description       = "Managed by Terraform!"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = join("/", [var.my_public_ip, "32"])
  security_group_id = openstack_networking_secgroup_v2.security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "security_group_rule_udp" {
  description       = "Managed by Terraform!"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  remote_ip_prefix  = join("/", [var.my_public_ip, "32"])
  security_group_id = openstack_networking_secgroup_v2.security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "security_group_rule_tcp_ssh" {
  description       = "Managed by Terraform!"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = "22"
  port_ramge_max    = "22"
  remote_ip_prefix  = join("/", [var.my_public_ip, "32"])
  security_group_id = openstack_networking_secgroup_v2.security_group.id
}

################# network private ##############################################################################

resource "openstack_networking_network_v2" "network_private" {
    name = "private_net"
    admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_private" {
  network_id = openstack_networking_network_v2.network_private.id
  cidr = "10.10.10.0/24"
}

################# network public ##############################################################################

data "openstack_networking_network_v2" "network_public" {
  name = var.public_network_name
}
