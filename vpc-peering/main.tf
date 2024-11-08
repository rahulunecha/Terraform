provider "aws" {
  region = var.aws_region
}

# Create VPC 1
resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc1_cidr
  tags = {
    Name = "VPC 1"
  }
}

# Create VPC 2
resource "aws_vpc" "vpc2" {
  cidr_block = var.vpc2_cidr
  tags = {
    Name = "VPC 2"
  }
}

# Create Route Table for VPC 1
resource "aws_route_table" "rt_vpc1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "Route Table for VPC 1"
  }
}

# Create Route Table for VPC 2
resource "aws_route_table" "rt_vpc2" {
  vpc_id = aws_vpc.vpc2.id

  tags = {
    Name = "Route Table for VPC 2"
  }
}

# VPC Peering Connection
resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id        = aws_vpc.vpc1.id
  peer_vpc_id   = aws_vpc.vpc2.id
  auto_accept   = true  # Auto-accepts peering if within the same account

  tags = {
    Name = "VPC Peering Connection between VPC 1 and VPC 2"
  }
}

# Route for VPC 1 to access VPC 2 via VPC Peering
resource "aws_route" "route_to_vpc2" {
  route_table_id            = aws_route_table.rt_vpc1.id
  destination_cidr_block    = var.vpc2_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

# Route for VPC 2 to access VPC 1 via VPC Peering
resource "aws_route" "route_to_vpc1" {
  route_table_id            = aws_route_table.rt_vpc2.id
  destination_cidr_block    = var.vpc1_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}
