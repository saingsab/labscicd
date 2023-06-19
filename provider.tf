terraform {
  required_providers {
    alicloud = {
      source = "aliyun/alicloud"
      version = "1.206.0"
    }
  }
}

# Configure the Alicloud Provider
provider "alicloud" {
  region     = "${var.region}"
}