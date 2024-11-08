# Define provider
provider "aws" {
  region = "eu-north-1"  # Replace with your desired region
}

# Create a new security group
resource "aws_security_group" "example_sg" {
  name        = "example-security-group"
  description = "Security group for example instance"

  # Inbound rules
  ingress {
    from_port   = 22                  # SSH port
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]       # Replace with specific CIDR blocks for production
  }

  ingress {
    from_port   = 80                  # HTTP port
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-sg"
  }
}

# Create an EC2 instance and attach the security group
resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0"   # Replace with an appropriate AMI ID for your region
  instance_type = "t3.micro"

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.example_sg.id]

  tags = {
    Name = "example-instance"
  }
}

output "instance_id" {
  value = aws_instance.example_instance.id
}

output "security_group_id" {
  value = aws_security_group.example_sg.id
}
