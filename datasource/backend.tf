terraform {
  backend "s3" {
    bucket = "terraform-tf-buckets"
    key = "terraform/terraform.tfstate"
    region = "us-east-1"
    
  }
}