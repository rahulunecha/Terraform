resource "aws_db_instance" "oracle_rds" {

  allocated_storage       = 20                 # Storage in GB
  engine                  = "oracle-se2"       # Select Oracle Standard Edition 2
  engine_version          = "19.0.0.0.ru-2022-07.rur-2022-07.r1" # Use a supported version
  instance_class          = "db.m6i.xlarge"     # Choose an appropriate instance class
  db_name                 = "mydatabase"       # Database name
  username                = "admin"            # Master username
  password                = "password123"  # Master password (keep this secure)
  publicly_accessible     = true               # Set to true if you want public access
  skip_final_snapshot     = true               # Skip final snapshot on deletion
  
  # Optional: Additional configurations
  vpc_security_group_ids  = ["sg-0534de5a41b183c8f"] # Security group for access control
  storage_type            = "gp2"                  # General purpose SSD
  backup_retention_period = 7                      # Retain backups for 7 days

  # Tags (optional)
  tags = {
    Name = "MyOracleRDSInstance"
  }
}
