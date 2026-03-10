output "network_id" {
  description = "The ID of the network"
  value       = module.network.network_id
}

output "router_id" {
  description = "The ID of the router"
  value       = module.network.router_id
}

output "subnets" {
  description = "The subnets of the network"
  value       = module.network.subnets
}
