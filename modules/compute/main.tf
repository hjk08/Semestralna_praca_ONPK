# --- compute/main.tf --

################## sec group #############################################################################

resource "openstack_networking_secgroup_v2" "security_group" {
  name        = var.sec_group_name
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
  port_range_max    = "22"
  remote_ip_prefix  = join("/", [var.my_public_ip, "32"])
  security_group_id = openstack_networking_secgroup_v2.security_group.id
}

################## compute instance  ####################################################################

data "openstack_compute_flavor_v2" "flavor" {
  name = var.flavor_name
}

data "openstack_images_image_v2" "image" {
  name = local.image.ubuntu.name
}

resource "openstack_compute_instance_v2" "instance" {
  name            = var.instance_name
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id
  key_pair        = var.keypair
  security_groups = [openstack_networking_secgroup_v2.security_group.name]
  
  network {
    name = var.private_network_name
    fixed_ip_v4 = var.static_ip
  }
}