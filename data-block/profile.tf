provider "aws" {
   profile = "1rahul"
   region  = "eu-north-1"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}