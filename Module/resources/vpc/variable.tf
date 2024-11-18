variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16" # Modify as needed
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {
    Name        = "MyVPC"
    Environment = "Dev"
  }
}
