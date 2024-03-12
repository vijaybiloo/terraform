data "aws_ami" "ami_id" {
    most_recent = true
    owners = ["amazon"] # we can keep the AWS Account ID "137112412989"

    filter {
        name   = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-*.2-x86_64-gp2"]
    }
}

output "ami_id" {
  value = data.aws_ami.ami_id.id
}

data "aws_vpc" "default" {
  default = true
} 

output "vpc_info" {
  value = data.aws_vpc.default
}

resource "aws_security_group" "allow-http" {
    name = "vishnu"
    vpc_id = data.aws_vpc.default.id
        description = "Allow port 80"

        ingress {
            description      = "Allowing all inbound "
            from_port        = 80
            to_port          = 80
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        }
        egress {
            from_port        = 0
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]  
        }

}
