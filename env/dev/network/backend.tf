terraform {
  backend "oss" {
    access_key          = "LTAI5t5AfWGj76"
    secret_key          = "NKUISupaBAzGuGbsL4S"
    bucket              = "tf-backend-datas"
    prefix              = "dev/network"
    key                 = "terraform-dev-network.tfstate"
    region              = "cn-beijing"
    tablestore_endpoint = "https://tftablenew.cn-beijing.ots.aliyuncs.com"
    tablestore_table    = "myterraformtable"
  }
}