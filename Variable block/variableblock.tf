variable "this_image_id" {
     type = string
     default = "ami-08eb150f611ca277f "
}

# this means unique name
# from main.tf/resource.tf  we have to take resouces of ec2  (variables)
#variable "resources of ec2/iam user/bucket"
#type = datatypes  eg: string
#default = values of datatypes  eg: "ami image id"


variable "this_disable_api_stop" {
     type = bool
     default = false
}

variable "this_disable_api_termination" {
     type = bool
     default = false
}

variable "this_instance_type" {
     type = string
     default = "t2.micro"
}


variable "this_vpc_security_group_ids" {
     type = string
     default = "sg-0c5ff0ec915bd9f7b"
}

variable "this_count" {
     type = number
     default = 2
}


variable "this_list" {
    type = list 
    default = ["t4g.nano" , "2" , "false"]
     
}