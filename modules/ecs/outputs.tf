output "ecs_ip" {
  value = alicloud_instance.myecs.public_ip
}

output "ecs_id" {
  value = alicloud_instance.myecs.id
}