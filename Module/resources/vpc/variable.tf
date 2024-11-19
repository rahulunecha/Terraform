variable "this_vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "this_vpc_tags" {
  description = "Tags for the VPC"
}

variable "this_subnet_pub_cidr_block" {
  description = "CIDR block for the public subnet"
}

variable "this_subnet_pub_map_ip" {
  description = "Whether to map public IPs on launch"
}

variable "this_subnet_pub_tags" {
  description = "Tags for the public subnet"
}

variable "this_vpc_az" {
  description = "Availability Zone for the subnet"
}
