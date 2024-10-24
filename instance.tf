provider "aws" {
  region = "eu-north-1"
  access_key = "AKIAS252WM72KSEPNMS"
  secret_key = "zSB+/CIv/IyO0AtY3y0M3ER9/KBT/TIJ+lHPOG"
}


resource "aws_instance" "vm1" {
  ami = "ami-08eb150f611ca277f"
  instance_type = "t3.micro"
  key_name = "kartik"
}
