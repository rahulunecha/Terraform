provider "aws" {
  region = "eu-north-1"
}

module "vpc_with_subnet" {
  source              = "./modules/vpc_with_subnet"
  vpc_cidr_block      = "10.0.0.0/16"
  enable_dns_support  = true
  enable_dns_hostnames = true

  vpc_tags = {
    Name        = "MergedVPC"
    Environment = "Dev"
  }

  subnet_cidr_block   = "10.0.1.0/24"
  availability_zone   = "eu-north-1a"

  subnet_tags = {
    Name = "MergedSubnet"
  }
}
