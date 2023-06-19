
#ECS instance for DEV
resource "alicloud_instance" "dev_instance" {
    availability_zone = "ap-southeast-1a"
    security_groups   = [alicloud_security_group.sg_devgroup.id]
    key_name = var.key_pair

# series III
  instance_type              = "ecs.n4.large"
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = "web_dev_system_disk_name"
  system_disk_description    = "web_dev_system_disk_description"
  image_id                   = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name              = "web_dev"
  vswitch_id                 = alicloud_vswitch.vswitch_dev.id


  data_disks {
    name        = "disk2"
    size        = 40
    category    = "cloud_efficiency"
    description = "disk2"
    # encrypted   = true
    # kms_key_id  = alicloud_kms_key.key.id
  }
  user_data = <<-EOL
    #!/bin/bash -xe
        
    apt update -y
    apt install nginx -y
    systemctl start nginx

    EOL

  tags = {
    Name = "DevSRV"
  }
}

#ECS instance for PRD
resource "alicloud_instance" "prd_instance" {
    availability_zone = "ap-southeast-1a"
    security_groups   = [alicloud_security_group.sg_devgroup.id]
    key_name = var.key_pair

# series III
  instance_type              = "ecs.n4.large"
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = "web_prd_system_disk_name"
  system_disk_description    = "web_prd_system_disk_description"
  image_id                   = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name              = "web_prd"
  vswitch_id                 = alicloud_vswitch.vswitch_prd.id


  data_disks {
    name        = "disk2"
    size        = 40
    category    = "cloud_efficiency"
    description = "disk2"
    # encrypted   = true
    # kms_key_id  = alicloud_kms_key.key.id
  }
  user_data = <<-EOL
    #!/bin/bash -xe
        
    apt update -y
    apt install nginx -y
    systemctl start nginx

    EOL

  tags = {
    Name = "PRDSRV"
  }
}