aws_profile           = "kartik"
aws_region            = "eu-north-1"
db_identifier         = "my-oracle-db"
db_allocated_storage  = 20
db_instance_class     = "db.m5.large"
db_name               = "mydb"
db_username           = "admin"
db_password           = "admin123"   # Set a secure password here
db_parameter_group    = "default.oracle-se2-19"  # Adjust if needed
publicly_accessible   = false
backup_retention_period = 7
multi_az              = false