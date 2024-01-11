resource "aws_instance" "myname" {
  ami           = lookup(var.ami, var.AWS_REGION)
  instance_type = "t2.micro"
  count         = 2
  tags = {
    Name = "nagireddy-${count.index}"
  }
}