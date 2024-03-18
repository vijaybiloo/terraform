resource "aws_instance" "roboshop" {
    ami = var.ami_id
    # instance_type = "t2.micro"
    for_each = var.instances
    instance_type = each.value
    tags = {
        Name = each.key

    }
}

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain}"
  type    = "A"
  ttl     = 3
  records = [each.key == "Web-Nginx" ? each.value.public_ip : each.value.private_ip ]
  for_each = aws_instance.roboshop
}

resource "aws_security_group" "allow_all" {
    name = var.sg_name
    description = "Allow all inbound traffic and all outbound traffic"

    ingress {
        description      = "Allowing all inbound "
        from_port        = 0
        to_port          = 0
        protocol         = "tcp"
        cidr_blocks      = var.sg_cidr
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = var.sg_cidr  
    }
}