

locals {
  region        = "cn-beijing-b"
  vsw_id        = data.terraform_remote_state.mydata.outputs.vsw_id
  secgroup_id   = data.terraform_remote_state.mydata.outputs.secgroup_id
  instance_name = "myecsserver"
  instance_type = "ecs.n1.tiny"
  counts        = 2
}

module "myecs" {
  count         = local.counts
  source        = "../../../modules/ecs"
  region        = local.region
  vsw_id        = local.vsw_id
  secgroup_id   = local.secgroup_id
  instance_name = "${local.instance_name}-${count.index}"
  instance_type = local.instance_type
}