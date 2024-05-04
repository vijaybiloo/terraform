resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Roboshop"
    Environment = "DEV"
    Terraform = true
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Roboshop-public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Roboshop-private"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Roboshop"
  }
}

# AWS Public Route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "roboshop-public"
  }
}

# AWS Private Route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "roboshop-private"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "allow_http_ssh" {
    name = "allow_http_ssh"
    description = "Allow only traffic from my Desktop"
    vpc_id = aws_vpc.main.id

    ingress {
        description      = "HTTPS from internet "
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        description      = "SSH from DESKTOP "
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["152.58.245.176/32"] # ["192.168.143.26/32"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    
    tags = {
        Name = "allow_http_ssh"
    }
}

resource "aws_instance" "Web-nginx" {
    ami = "ami-0f3c7d07486cad139" # "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
    associate_public_ip_address = true
    tags = {
        Name = "Web-nginx"
  }
}