
output "private_network_name" {
  value = module.network.private_network_name
}

output "keypair_name" {
  value = openstack_compute_keypair_v2.keypair.name
}