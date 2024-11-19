
module "ec2" {
    source = "/home/Module/Resources/EC2"
    this_image_id = "ami-08eb150f611ca277f"
    this_list = "t3.micro"
    this_disable_api_stop = false
    this_disable_api_termination = false
    #this_vpc_security_group_ids = "sg-0505874879e7ce6cd"
    this_aws_instance_subnet = module.vpc.subnet_id
    #this_sg_vpc_id = module.vpc.vpc_id
    //this_aws_vpc_id = module.aws_vpc.aws_vpc_id
}

module "vpc" {
     source = "/home/Module/Resources/VPC"
     this_vpc_cidr_block = "12.11.0.0/16"
     this_vpc_tags = "this_vpc"
     this_subnet_pub_cidr_block = "12.11.0.0/17"
     this_subnet_pub_map_ip  = true 
     this_subnet_pub_tags = "pub_subnet"
     this_vpc_az = "eu-north-1a"



}

output "instance_public_ip" {
  value = aws_instance.this_ubuntu.public_ip


}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.this_vpc.vpc_id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = module.this_subnet_pub.subnet_id
}
