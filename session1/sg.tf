resource "aws_security_group" "allow_all1" {
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