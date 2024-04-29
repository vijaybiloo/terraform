data "aws_vpc" "default" {
  default = true
}

# data "http" "myip" {
#   url = "https://ipv4.icanhazip.com"
# }

data "aws_ami" "devops_ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"] # this Owner ID is of Sivas 

  filter {
    name = "name"
    #values = ["amzn2-ami-kernel-5.10-hvm-*.2-x86_64-gp2"]
    values = ["Centos-8-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}