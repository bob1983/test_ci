variable "profile_name" { }
variable "region" { }

provider "aws" {
  profile = "${var.profile_name}"
  region  = "${var.region}"
}

resource "aws_spot_fleet_request" "sample" {
  iam_fleet_role  = "arn:aws:iam::844274499765:role/spot-fleet-role"
  spot_price      = "0.02"
  target_capacity = 1
  valid_until     = "2017-12-31T23:59:59Z"
  
  launch_specification {
    instance_type      = "m3.medium"
    ami                = "ami-afb09dc8"
    availability_zone  = "ap-northeast-1c"
    vpc_security_group_ids = ["sg-0a5a5168"]
  }
}
