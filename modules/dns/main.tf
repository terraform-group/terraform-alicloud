# demo.zeyang.site
resource "alicloud_dns_record" "record" {
  name        = var.dns_zone_name
  host_record = var.dns_record
  type        = var.record_type
  value       = var.eip
}
