provider "aws" {
      region = "eu-north-1"
      profile = "configs"
      shared_credentials_files = ["/home/rahul/.aws/credentials"]
    
}
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket        = "new-terraform-state-bucket" # Replace with a unique bucket name
  acl           = "private"

  tags = {
    Name        = "TerraformStateBucket"
    Environment = "Dev"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "TerraformLocks"
    Environment = "Dev"
  }
}

#LockID
terraform {
    backend "s3" {
        bucket = "new-terraform-state-bucket"
        key = "terraform.tfstate"
        dynamodb_table = "terraform_locks"
        region = "eu-north-1"
        profile = "configs"
        shared_credentials_files = ["/home/anup/.aws/credentials"]
    }
}


resource "aws_instance" "ths_instance" {
  ami = "ami-0a38c1c38a15fed74"
  //key_name = "anupdel"
  instance_type = "t2.micro"
  //security_groups = ["sg-02582bf615cdb71bb"]
  count = 1
  
  
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo echo "hello world this is Batc24" >> /var/www/html/index.html
    EOF
   tags = {
    Name = "first_terraform_instance"

  } 
    
}