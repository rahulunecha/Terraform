variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_id" {
  description = "VPC ID of the first VPC"
  type        = string
}

variable "peer_vpc_id" {
  description = "VPC ID of the peer VPC"
  type        = string
}

variable "peer_owner_id" {
  description = "Account ID of the peer VPC owner (if different account)"
  type        = string
  default     = ""
}

variable "auto_accept" {
  description = "Auto-accept the VPC peering connection if in the same account"
  type        = bool
  default     = true
}

variable "peering_name" {
  description = "Name for the VPC peering connection"
  type        = string
  default     = "vpc-peering"
}

variable "route_table_id_vpc1" {
  description = "Route table ID for the first VPC"
  type        = string
}

variable "route_table_id_vpc2" {
  description = "Route table ID for the peer VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the first VPC"
  type        = string
}

variable "peer_vpc_cidr" {
  description = "CIDR block of the peer VPC"
  type        = string
}
