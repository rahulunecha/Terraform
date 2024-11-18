provider "aws" {
  region = "eu-north-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  #ami_value = "ami-08eb150f611ca277f " # replace this
  #instance_type_value = "t3.micro"
  #subnet_id_value = "subnet-0952a4d82b16f1e32". # replace this
  vpc_cidr_block = "10.0.0.0/16"
  

}