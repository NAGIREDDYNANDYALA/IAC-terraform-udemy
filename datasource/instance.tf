data "aws_availability_zones" "available" {}
resource "aws_instance" "myname" {
  ami           = lookup(var.ami, var.AWS_REGION)
  instance_type = var.aws_instance_type
  availability_zone = data.aws_availability_zones.available.names[count.index]
  count         = 2
  tags = {
    Name = "nagireddy-${count.index}"
  }
}