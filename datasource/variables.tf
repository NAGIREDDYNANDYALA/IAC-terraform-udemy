# variables for region
variable "AWS_REGION" {
  default = "us-east-1"
}
# variables for AMI
variable "ami" {
  type = map(any)
  default = {
    us-east-1  = "ami-0c0b74d29acd0cd97"
    ap-south-1 = "ami-0c84181f02b974bc3"
  }
}

# variables for instance type
variable "aws_instance_type" {
  default = "t2.micro"
}