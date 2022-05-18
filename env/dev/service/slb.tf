locals {
  address_type       = "intranet"
  slb_name           = "dev-slb"
  payment_type       = "PayAsYouGo"
  server_group_name  = "webserver"
  ecs_ids            = module.myecs.*.ecs_id
  backend_port       = 80
  backend_weight     = 100
  frontend_port      = 80
  protocol           = "http"
  scheduler          = "rr"
  load_balancer_spec = "slb.s1.small"
  bandwidth          = 10
}

module "dev-slb" {
  source             = "../../../modules/slb"
  address_type       = local.address_type
  slb_name           = local.slb_name
  payment_type       = local.payment_type
  server_group_name  = local.server_group_name
  ecs_ids            = local.ecs_ids
  backend_port       = local.backend_port
  backend_weight     = local.backend_weight
  frontend_port      = local.frontend_port
  protocol           = local.protocol
  scheduler          = local.scheduler
  vsw_id             = data.terraform_remote_state.mydata.outputs.vsw_id
  load_balancer_spec = local.load_balancer_spec
  bandwidth          = local.bandwidth
}