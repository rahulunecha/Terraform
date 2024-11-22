provider "aws" {
    region =  "eu-north-1"
    profile = "configs"
}
 

resource "aws_iam_user" "main_user" {
    name = "linux.${count.index}"
    count = 3          
}
resource "aws_iam_user" "main_user_1" {
    count = length(var.user_name)
    name =  var.user_name[count.index]
}

variable "user_name" {
      default = ["ram", "laxman", "sita"]
}

