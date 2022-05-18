resource "alicloud_eip_address" "eip" {
}

resource "alicloud_eip_association" "eip_asso" {
  allocation_id = alicloud_eip_address.eip.id
  instance_id   = var.instance_id
}