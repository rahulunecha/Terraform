variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-north-1"
}

variable "vpc1_cidr" {
  description = "CIDR block for VPC 1"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc2_cidr" {
  description = "CIDR block for VPC 2"
  type        = string
  default     = "10.1.0.0/16"
}
