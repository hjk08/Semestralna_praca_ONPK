# --- network/main.tf --

resource "openstack_networking_secgroup_v2" "security_group" {
  name        = "ONPK_praca_sec_group"
  description = "Managed by Terraform!"
}

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

