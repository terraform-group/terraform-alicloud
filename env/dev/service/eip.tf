locals {
  instance_id = module.dev-slb.slb_id
}

module "dev-eip" {
  source      = "../../../modules/eip"
  instance_id = local.instance_id

}