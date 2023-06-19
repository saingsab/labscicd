#VPC and vswitch
resource "alicloud_vpc" "vpc_igdw" {
  name = "vpc-igdw"
  cidr_block = "10.0.0.0/8"
}

resource "alicloud_vswitch" "vswitch_dev" {
    name = "dev-subnet"
    vpc_id     = alicloud_vpc.vpc_igdw.id
    cidr_block = "10.1.0.0/16"
    zone_id    = "ap-southeast-1a"

  depends_on = [alicloud_vpc.vpc_igdw]
}

resource "alicloud_vswitch" "vswitch_prd" {
    name = "prd-subnet"
    vpc_id     = alicloud_vpc.vpc_igdw.id
    cidr_block = "10.0.0.0/16"
    zone_id    = "ap-southeast-1a"

    depends_on = [alicloud_vpc.vpc_igdw]
}