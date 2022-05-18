provider "alicloud" {
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
  region     = var.region
}


data "terraform_remote_state" "mydata" {
  backend = "oss"
  config = {
    access_key = "LTAI5tC6oDjBoGAv5AfWGj76"
    secret_key = "NKUISupaVOUiWpl74mcBAzGuGbsL4S"
    bucket     = "tf-backend-datas"
    prefix     = "dev/network"
    key        = "terraform-dev-network.tfstate"
    region     = "cn-beijing"
  }
}