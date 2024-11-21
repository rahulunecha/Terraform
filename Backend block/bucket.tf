resource "aws_s3_bucket" "state_bucket" {
  bucket = "new-terraform-state-bucket"
  acl    = "private"

  tags = {
    Name        = "TerraformState"
    Environment = "Dev"
  }
}