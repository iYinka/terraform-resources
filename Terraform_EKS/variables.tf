variable "REGION" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "CLUSTER_NAME" {
  description = "This is the name of the EKS cluster."
  type        = string
  default     = "terra-eks"
}