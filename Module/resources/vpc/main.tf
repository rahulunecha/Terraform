resource "aws_vpc" "main" {
  cidr_block = var.this_vpc_cidr_block

  tags = {
    Name = var.this_vpc_tags
  }
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.this_subnet_pub_cidr_block
  map_public_ip_on_launch = var.this_subnet_pub_map_ip
  availability_zone       = var.this_vpc_az

  tags = {
    Name = var.this_subnet_pub_tags
  }
}




