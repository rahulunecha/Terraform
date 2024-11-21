provider "aws" {
  region = "eu-north-1"
}
resource "aws_s3_bucket" "state_bucket" {
  bucket = "new-terraform-state-bucket"
  acl    = "private"

  tags = {
    Name        = "TerraformState"
    Environment = "Dev"
  }
}