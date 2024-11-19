output "instance_public_ip" {
  value = aws_instance.this_ubuntu.public_ip


}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc_with_subnet.vpc_id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = module.vpc_with_subnet.subnet_id
}
