variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}
variable "ZONE2" {
  default = "us-east-1b"
}
variable "ZONE3" {
  default = "us-east-1c"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-09694bfab577e90b0"
    us-east-1 = "ami-008677ef1baf82eaf"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "terra01key.pub"
}

variable "PRIV_KEY" {
  default = "terra01key"
}

variable "MYIP" {
  default = "0.0.0.0/0"
}

variable "BUCKET" {
  default = "terratest-bucket"
}