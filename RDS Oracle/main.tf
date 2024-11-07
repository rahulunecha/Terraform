resource "aws_db_instance" "oracle_rds" {
  # Basic configurations
  allocated_storage       = 20                 # Storage in GB
  engine                  = "oracle-se2"       # Select Oracle Standard Edition 2
  engine_version          = "19.0.0.0.ru-2022-07.rur-2022-07.r1" # Use a supported version
  instance_class          = "db.t3.medium"     # Choose an appropriate instance class
  name                    = "mydatabase"       # Database name
  username                = "admin"            # Master username
  password                = "yourpassword123"  # Master password (keep this secure)
  publicly_accessible     = true               # Set to true if you want public access
  skip_final_snapshot     = true               # Skip final snapshot on deletion
  
  # Optional: Additional configurations
  db_subnet_group_name    = "your_subnet_group"    # If using a custom subnet
  vpc_security_group_ids  = ["sg-0123456789abcdef"] # Security group for access control
  storage_type            = "gp2"                  # General purpose SSD
  backup_retention_period = 7                      # Retain backups for 7 days

  # Tags (optional)
  tags = {
    Name = "MyOracleRDSInstance"
  }
}
