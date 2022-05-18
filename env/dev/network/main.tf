provider "alicloud" {
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
  region     = var.region
}

locals {
  vpc_cidr_block = "172.80.0.0/12"
  vpc_name       = "dev-vpc"
  vsw_cidr_block = "172.80.0.0/21"
  zone_id        = "cn-beijing-b"
  vpc_id         = module.devvpc.vpc_id
}

module "devvpc" {
  source         = "../../../modules/vpc"
  vpc_cidr_block = local.vpc_cidr_block
  vpc_name       = local.vpc_name
  vsw_cidr_block = local.vsw_cidr_block
  zone_id        = local.zone_id
}

module "devsecgroup" {
  source = "../../../modules/secgroup"
  vpc_id = local.vpc_id

}