resource "aws_instance" "this_aws_instance" {
  ami = "ami-05edb7c94b324f73c"
  vpc_security_group_ids = ["sg-0178be7f7b3ea1d2c"]
  key_name = "newrahul"
  instance_type = "t3.micro"

  provisioner "remote-exec" {
    inline = [
      "sudo yum update",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user" # Default user for ec2-user AMIs; replace if needed
      private_key = file("${path.module}/id_rsa.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "MyInstance"
  }
}