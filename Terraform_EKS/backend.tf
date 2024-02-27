terraform {
  backend "s3" {
    bucket = "eks-bkt"
    key    = "terra_state_file/terraform.tfstate"
    region = "us-east-1"
  }

}