# vpc cidr block
variable "cidr_block" {
  default = "10.0.0.0/16"
}

# public subnet cidr block
variable "subnet-cidr" {
  default = "10.0.0.0/24"
}
# public subnet az
variable "az-public_subnet" {
  default = "us-east-1a"
}

# private subnet cidr block
variable "private-cidr" {
  default = "10.0.16.0/20"
}

# private subnet az
variable "az-private_subnet" {
  default = "us-east-1a"
}

# variable for public subnet instance
variable "ami" {
  default = "ami-0cf10cdf9fcd62d37"
}

# public ec2 instance type
variable "instance_type" {
  default = "t2.micro"
}