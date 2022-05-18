terraform {
  backend "oss" {
    access_key          = "LTAIv5AfWGj76"
    secret_key          = "NKUIAzGuGbsL4S"
    bucket              = "tf-backend-datas"
    prefix              = "global/backend"
    key                 = "terraform-global-backend.tfstate"
    region              = "cn-beijing"
    tablestore_endpoint = "https://tftablenew.cn-beijing.ots.aliyuncs.com"
    tablestore_table    = "myterraformtable"
  }
}