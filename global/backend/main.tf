provider "alicloud" {
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
  region     = "cn-beijing"
}

## oss
resource "alicloud_oss_bucket" "tfbucket" {
  bucket = "tf-backend-datas"
  acl    = "private"
}

## tablestore
resource "alicloud_ots_instance" "tftable" {
  name        = "tftablenew"
  description = "terraform tablestore"
  accessed_by = "Any"
  tags = {
    Created = "TF"
    For     = "Building table"
  }
}

resource "alicloud_ots_table" "basic" {
  instance_name = alicloud_ots_instance.tftable.name
  table_name    = "myterraformtable"
  primary_key {
    name = "LockID"
    type = "String"
  }
  time_to_live                  = -1
  max_version                   = 1
  deviation_cell_version_in_sec = 1
}