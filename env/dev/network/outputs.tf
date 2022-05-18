output "vpc_id" {
  value = module.devvpc.vpc_id
}

output "vsw_id" {
  value = module.devvpc.vsw_id
}

output "secgroup_id" {
  value = module.devsecgroup.secgroup_id
}