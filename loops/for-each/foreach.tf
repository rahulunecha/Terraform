resource "aws_instance" "this_aws_instance" {
    for_each = toset(var.aws_ami)
    ami = each.value
    vpc_security_group_ids = ["sg-0178be7f7b3ea1d2c"]
    #key_name = "delete_ore"
    instance_type = "t3.micro"
}

variable "aws_ami" {
    type = list(string)
    default = ["ami-0658158d7ba8fd573","ami-08eb150f611ca277f","ami-02a0945ba27a488b7"]
}  

output "name" {
   value = [ for instance in var.aws_ami:
    aws_instance.this_aws_instance[instance].public_ip
   ]
}


resource "aws_iam_user" "name" {
    name = "sample.${count.index}"
    count = 3
}

resource "aws_iam_user" "name2" {
    count = length(var.names)
    name = var.names[count.index]
}
variable "names" {
    default = ["name1","name2", "name3"]
  
}