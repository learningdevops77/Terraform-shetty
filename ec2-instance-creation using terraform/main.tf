provider "aws" {
    region     = "ap-south-1"
    access_key = ""
    secret_key = ""
  }

  resource "aws_instance" "ec2" {
    ami           = "ami-095347606651c955"
    instance_type = "t2.medium"
    security_groups = ["default"]
    key_name      = "new"
    
    root_block_device {
      volume_size           = 20
      volume_type           = "gp3"
      delete_on_termination = true
    }

    tags = {
      Name = "Jenkins-admin-server"
    }
  }

  output "PublicIP" {
    value = aws_instance.ec2.public_ip
  }
