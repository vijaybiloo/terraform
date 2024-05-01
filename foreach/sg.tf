resource "aws_security_group" "roboshop" {
  name        = "roboshop"
  description = "Allow HTTP HTTPS and SSH traffic"


  dynamic ingress {
    for_each = var.ingress
    content {
        description = ingress.value["description"]
        protocol  = ingress.value.protocol
        from_port = ingress.value.from_port
        to_port   = ingress.value.to_port
        cidr_blocks = ingress.value.cidr_blocks
    }
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop"
  }
}