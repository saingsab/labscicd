#DEVEIP
resource "alicloud_eip_address" "deveip" {
  address_name         = "dev-devsrv"
  isp                  = "BGP"
  internet_charge_type = "PayByBandwidth"
  payment_type         = "PayAsYouGo"
}

#PRD
resource "alicloud_eip_address" "prdeip" {
  address_name         = "prd-mainsvr"
  isp                  = "BGP"
  internet_charge_type = "PayByBandwidth"
  payment_type         = "PayAsYouGo"
}

#Assoc DEVEIP to DEV Sever
resource "alicloud_eip_association" "eip_assodev" {
  allocation_id = alicloud_eip_address.deveip.id
  instance_id   = alicloud_instance.dev_instance.id
}

#Assoc PRDEIP to PRD Sever
resource "alicloud_eip_association" "eip_assoprd" {
  allocation_id = alicloud_eip_address.prdeip.id
  instance_id   = alicloud_instance.prd_instance.id
}