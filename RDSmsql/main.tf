resource "aws_db_instance" "this_rds" {
  allocated_storage    = var.this_list[0]                
  engine               = var.this_list[1]                
  engine_version       = var.this_list[2]                     
  instance_class       = var.this_list[3]           
  db_name              = var.this_list[4]           
  username             = var.this_list[5]                   
  password             = var.this_list[6]               
  parameter_group_name = var.this_list[7]        
  skip_final_snapshot  = var.this_list[8]                     
  publicly_accessible  = var.this_list[9]                      
  vpc_security_group_ids = [var.this_list[10]]  
  multi_az             = var.this_list[11]                     
}