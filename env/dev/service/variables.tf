variable "alicloud_access_key" {
  type = string
}
variable "alicloud_secret_key" {
  type = string
}

variable "region" {
  type        = string
  description = "region name"
  default     = "cn-beijing"
  sensitive   = true
}