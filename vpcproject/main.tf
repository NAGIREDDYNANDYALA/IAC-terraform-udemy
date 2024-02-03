# vpc creation
resource "aws_vpc" "VPCEC2" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc_tf"
  }
}

# security group creation 
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_sg"
  description = "Security group allowing SSH traffic"
  vpc_id      = aws_vpc.VPCEC2.id


  // Ingress rule allowing SSH traffic from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Egress rule allowing all traffic to go out
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Tags for the security group
  tags = {
    Name = "scg_allow_ssh_sg"
  }
  depends_on = [aws_vpc.VPCEC2]
}
# Internet Gateway Creation
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.VPCEC2.id

  tags = {
    Name = "IGW_TF"
  }
  depends_on = [aws_vpc.VPCEC2]
}
# Elastic Ip creation
resource "aws_eip" "EIP" {
  vpc = true
  tags = {
    Name = "EIP"
  }
}
# public subnet creation in above VPC
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.VPCEC2.id
  cidr_block              = var.subnet-cidr
  availability_zone       = var.az-public_subnet
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet-A"
  }
  depends_on = [aws_vpc.VPCEC2]
}

# private subnet creation in above vpc
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.VPCEC2.id
  cidr_block        = var.private-cidr
  availability_zone = var.az-private_subnet
  tags = {
    Name = "PrivateSubnet"
  }
  depends_on = [aws_vpc.VPCEC2]
}
# NAT Gateway in public subnet
resource "aws_nat_gateway" "NATGW" {
  allocation_id = "${aws_eip.EIP.id}"
  subnet_id = "${aws_subnet.public_subnet.id}"
  tags = {
    Name = "natgateway-tf"
  }
depends_on = [ aws_eip.EIP , aws_subnet.public_subnet ]
}

