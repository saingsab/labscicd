#Security Group for dev
resource "alicloud_security_group" "sg_devgroup" {
  name = "sg_devgroup"
  vpc_id     = alicloud_vpc.vpc_igdw.id
}
resource "alicloud_security_group_rule" "allow_web" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.sg_devgroup.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_security_group_rule" "allow_ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 2
  security_group_id = alicloud_security_group.sg_devgroup.id
  cidr_ip           = "0.0.0.0/0"
}