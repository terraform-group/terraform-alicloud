resource "alicloud_slb_load_balancer" "slb" {
  load_balancer_name = var.slb_name
  address_type       = var.address_type
  payment_type       = var.payment_type
  vswitch_id         = var.vsw_id
  load_balancer_spec = var.load_balancer_spec
}

resource "alicloud_slb_server_group" "webserver" {
  load_balancer_id = alicloud_slb_load_balancer.slb.id
  name             = var.server_group_name
}

resource "alicloud_slb_server_group_server_attachment" "default" {
  count           = length(var.ecs_ids)
  server_group_id = alicloud_slb_server_group.webserver.id
  server_id       = var.ecs_ids[count.index]
  port            = var.backend_port
  weight          = var.backend_weight
}

resource "alicloud_slb_listener" "default" {
  load_balancer_id = alicloud_slb_load_balancer.slb.id
  backend_port     = var.backend_port
  frontend_port    = var.frontend_port
  protocol         = var.protocol
  scheduler        = var.scheduler
  bandwidth        = var.bandwidth
  server_group_id  = alicloud_slb_server_group.webserver.id
}