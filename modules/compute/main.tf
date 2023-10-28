# --- compute/main.tf --

data "openstack_compute_flavor_v2" "flavor" {
  name = var.flavor_name
}

data "openstack_images_image_v2" "image" {
  name = local.image.ubuntu.name
}

data "openstack_compute_keypair_v2" "keypair" {
  name = var.keypair
}

resource "openstack_compute_instance_v2" "instance" {
  name            = "${var.instance_name}"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id
  key_pair        = "${var.keypair}"
 
 
 //security_groups = [data.openstack_networking_secgroup_v2.default.name]

 // user_data = var.user_data

  //network {
  //  name = var.network_id
  //}
}