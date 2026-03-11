output "network" {
  description = "The network resource"
  value = length(openstack_networking_network_v2.this) > 0 ? {
    id       = openstack_networking_network_v2.this[0].id
    name     = openstack_networking_network_v2.this[0].name
    tags     = openstack_networking_network_v2.this[0].tags
    all_tags = openstack_networking_network_v2.this[0].all_tags
  } : null
}

output "network_id" {
  description = "The ID of the network"
  value       = length(openstack_networking_network_v2.this) > 0 ? openstack_networking_network_v2.this[0].id : null
}

output "router_id" {
  description = "The ID of the router"
  value       = length(openstack_networking_router_v2.this) > 0 ? openstack_networking_router_v2.this[0].id : null
}

output "subnets" {
  description = "List of created subnets"
  value = [for subnet in openstack_networking_subnet_v2.this : {
    id   = subnet.id
    name = subnet.name
    cidr = subnet.cidr
    tags = subnet.tags
  }]
}
