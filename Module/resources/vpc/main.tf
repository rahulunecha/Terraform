provider "aws" {
  region = "eu-north-1" # Replace with your desired AWS region
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = var.vpc_tags
}
