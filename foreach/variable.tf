variable ami_id {
  type        = string
  default     = "ami-0f3c7d07486cad139"
}

variable "instances" {
  type        = map
  default     = {
    mongoDB = "t3.medium"
    Catalogue = "t2.micro"
    Cart ="t2.micro"
    User = "t2.micro"
    Redis = "t2.micro"
    RabbitMQ = "t2.micro"
    Mysql = "t3.medium"
    Shipping = "t2.micro"
    Payment = "t2.micro"
    Dispatch = "t2.micro"
    Web-Nginx = "t2.micro"
  }
}

variable "zone_id" {
  default = "Z0630267198Z1Q0Y8S23T"
}

variable "domain_id" {
  default = "jiondevops.site"
}

variable "ingress" {
  type        = list
  default     = [
    {
    from_port = 80
    to_port = 80
    description = "allowing Port 80 from public"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
    from_port = 443
    to_port = 443
    description = "allowing Port 443 from public"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
    from_port = 22
    to_port = 22
    description = "allowing Port 22 from public"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

]
}
