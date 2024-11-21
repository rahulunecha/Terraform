

#LockID
terraform {
    backend "s3" {
        bucket = "bucket-tfstate1"
        key = "terraform.tfstate"
        dynamodb_table = "teble-tfdb"
        region = "eu-north-1"
        profile = "configs"
        shared_credentials_files = ["/home/rahul/.aws/credentials"]
    }
}


resource "aws_instance" "ths_instance" {
  ami = "ami-08eb150f611ca277f"
  //key_name = "newrahul"
  instance_type = "t3.micro"
  //security_groups = ["sg-0178be7f7b3ea1d2c"]
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