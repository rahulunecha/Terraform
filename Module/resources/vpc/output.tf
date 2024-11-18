output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = aws_subnet.main.id
}

output "subnet_cidr_block" {
  description = "The CIDR block of the Subnet"
  value       = aws_subnet.main.cidr_block
}
