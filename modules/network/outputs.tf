
output "want_public_network" {
  value = var.want_public_network
}

output "private_network_name" {
  value = openstack_networking_network_v2.network.name
}

output "public_network_name" {
  value = var.public_network_name
}