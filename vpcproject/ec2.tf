
# EC2 instance createion in public subnet
resource "aws_instance" "publicec2" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  subnet_id = "${aws_subnet.public_subnet.id}"
  key_name = "terraform"
  tags = {
    Name = "public-ec2"
  }
}
# EC2 instance creation in private instance
resource "aws_instance" "privateec2" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  subnet_id = "${aws_subnet.private_subnet.id}"
  tags = {
    Name = "private-ec2"
  }
}