


resource "aws_instance" "this_aws_instance" {
    for_each = toset(var.imageid)
    ami = each.value
    #vpc_security_group_ids = ["sg-032e1a4a1685a03be"]
    #key_name = "rahul"
    instance_type = "t3.micro"
    
}   

resource "aws_iam_user" "main_user"{
    for_each = toset(var.main_user_name)
    name = each.value
}

variable "main_user_name" {
    type = list(string)
   
    default = ["ubuntu","awslinux","windows"]
}

variable "imageid" {
    type = list(string)
    default = ["ami-02a0945ba27a488b7","ami-08eb150f611ca277f","ami-06f2889142bc3d7b3"]

}

output "aws_ec2" {
  value = [
    for instance in var.imageid:
        aws_instance.this_aws_instance[instance].public_ip
  ]
}