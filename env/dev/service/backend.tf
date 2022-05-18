terraform {
  backend "oss" {
    access_key          = "LTAI5tfWGj76"
    secret_key          = "NKmcBAzGuGbsL4S"
    bucket              = "tf-backend-datas"
    prefix              = "dev/service"
    key                 = "terraform-dev-service.tfstate"
    region              = "cn-beijing"
    tablestore_endpoint = "https://tftablenew.cn-beijing.ots.aliyuncs.com"
    tablestore_table    = "myterraformtable"
  }
}