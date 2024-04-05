variable "project_name" {
  default     = "roboshop"
}

variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "common_tags" {
  default     = {
    Project = "roboshop"
    Environment = "DEV"
    Terraform = true
  }
}

variable "public_subnet_cidr"{
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr"{
    default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "database_subnet_cidr"{
    default = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "sg_ingress_rules" {
  default = [
    {
      from_port = 0
      to_port = 0
      protocol = "-1"
      description = "Allowing all traffic from internet"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "instances" {
  default     = {
    MongoDB = "t3.medium"
    Mysql = "t3.medium"
    Calalogue = "t2.micro"
    User = "t2.micro"
    Cart = "t2.micro"
    Redis = "t2.micro"
    RabbitMQ = "t2.micro"
    Shipping = "t2.micro"
    Payment = "t2.micro"
    Dispatch = "t2.micro"
    Web-Ngnix = "t2.micro"
  }
}

variable "zone_name" {
  #default = "jiondevops.site"
  default = "vijaydeepak0812.online"
}
