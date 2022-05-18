locals {
  dns_zone_name = "zeyang.site"
  dns_record    = "deva"
  eip           = module.dev-eip.eip
  record_type   = "A"
}

module "mydns" {
  source        = "../../../modules/dns"
  dns_zone_name = local.dns_zone_name
  eip           = local.eip
  record_type   = local.record_type
  dns_record    = local.dns_record

}