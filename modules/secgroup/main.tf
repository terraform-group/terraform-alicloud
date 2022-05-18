//security_group 安全组
resource "alicloud_security_group" "group" {
  name                = "demo-group"
  vpc_id              = var.vpc_id
  security_group_type = "normal" //普通类型
}

//security_group_rule 规则
resource "alicloud_security_group_rule" "allow_80_tcp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = "0.0.0.0/0"
}

//security_group_rule 规则
resource "alicloud_security_group_rule" "allow_22_tcp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = "0.0.0.0/0"
}


