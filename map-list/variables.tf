variable "AWS_REGION" {
  default = "us-east-1"
}
variable "ami" {
  type = map(any)
  default = {
    us-east-1  = "ami-0c0b74d29acd0cd97"
    ap-south-1 = "ami-0c84181f02b974bc3"
  }
}
