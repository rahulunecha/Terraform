
provider "aws" {
   profile = "configs"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}
#provider "aws" {
#  region = "eu-north-1"
#}
