
data "openstack_compute_flavor_v2" "flavor_1" {
  name = var.flavor_name
}

data "openstack_images_image_v2" "image_1" {
  name = local.image.debian.name
}

data "openstack_networking_secgroup_v2" "default" {
  name = "default"
}

resource "openstack_compute_instance_v2" "instance" {
  name            = "${var.instance_name}"
  image_id        = data.openstack_images_image_v2.image_1.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor_1.id
  key_pair        = var.key_pair_name
  security_groups = [data.openstack_networking_secgroup_v2.default.name]

  user_data = var.user_data

  network {
    name = var.network_id
  }
}