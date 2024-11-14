# AWS provider configuration
provider "aws" {
  region = "us-west-1"  # Replace with your preferred AWS region
}

# Variables (replace these with your values)
variable "instance_type" { default = "t2.micro" }
variable "ami_id" { default = "ami-063d43db0594b521b" }  # (Linux)Replace with an appropriate AMI ID
variable "key_name" { default = "new1" }  # Replace with your EC2 key pair name
variable "domain_name" { default = "rucloud.site" }  # Replace with your domain name (e.g., "mywebsite.com")

# Security group allowing HTTP and SSH access
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 instance with Nginx for static hosting
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.web_sg.name]

  # Install Nginx and configure a simple static HTML page
  #for ubuntu path will /var/www/html/
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
              curl -O https://www.free-css.com/assets/files/free-css-templates/download/page295/handtime.zip
              unzip handtime.zip
              sudo rm -rf /usr/share/nginx/html/*
              sudo mv oxer-html/* /usr/share/nginx/html/
              sudo systemctl start nginx
              sudo systemctl enable nginx
            EOF

  tags = {
    Name = "web-server"
  }
}

# Create a Route 53 Hosted Zone if it doesn't already exist
resource "aws_route53_zone" "main" {
  name = var.domain_name
}

# Route 53 DNS record to point to the EC2 instance's public IP
resource "aws_route53_record" "web" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300
  records = [aws_instance.web_server.public_ip]
}

# Outputs
output "web_server_public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web_server.public_ip
}

output "website_url" {
  description = "Website URL"
  value       = "http://${var.domain_name}"
}
