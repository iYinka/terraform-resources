terraform {
  backend "s3" {
    bucket = "terra-01-bkt"
    key    = "terraform"
    region = "us-east-1"
  }
}
