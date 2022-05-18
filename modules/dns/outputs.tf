output "dns_name" {
    value = "${alicloud_dns_record.record.host_record}.${alicloud_dns_record.record.name}"
}