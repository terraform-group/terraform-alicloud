output "bucket_name" {
  value = alicloud_oss_bucket.tfbucket.bucket
}

output "table_name" {
  value = alicloud_ots_table.basic.table_name
}
