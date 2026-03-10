module "network" {
  source = "../../"

  create          = var.create
  name            = var.name
  name_prefix     = var.name_prefix
  use_name_prefix = var.use_name_prefix
  description     = var.description

  admin_state_up = var.admin_state_up
  az             = var.az

  router           = var.router
  router_tags      = var.router_tags
  router_fixed_ips = var.router_fixed_ips

  subnets     = var.subnets
  subnet_tags = var.subnet_tags
}
