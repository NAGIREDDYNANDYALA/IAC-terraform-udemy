data "aws_availability_zones" "available" {} # it will fetch all the availability zones

# To fetch the AMI IDs using the datasources
data "aws_ami" "amzlinux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}
