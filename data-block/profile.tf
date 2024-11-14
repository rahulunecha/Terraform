provider "aws" {
   profile = "configs"
   region  = "eu-north-1"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}