resource "aws_security_group" "oracle_rds_sg" {
  name        = "oracle-rds-sg"
  description = "Allow Oracle RDS access"

  ingress {
    from_port   = 1521               # Oracle's default port
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]      # Open to all IPs (restrict as needed)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

