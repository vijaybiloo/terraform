variable ami_id {
  type        = string
  default     = "ami-02d7fd1c2af6eead0"
}

variable "instances" {
  type        = map
  default     = {
    MongoDB = "t3.medium"
    Mysql = "t3.medium"
    Catalogue = "t2.micro"
    Cart = "t2.micro"
    User = "t2.micro"
    Redis = "t2.micro"
    RabbitMQ = "t2.micro"
    shipping = "t2.micro"
    payment = "t2.micro"
    dispatch = "t2.micro"
    Web-Nginx = "t2.micro"
  }
  
}

variable "zone_id" {
  type        = string
  default     = "Z0630267198Z1Q0Y8S23T"
}

variable "domain" {
  type        = string
  default     = "jiondevops.site"
}

variable sg_name {
  default     = "allow-all"
}

variable "sg_cidr" {
  default =["0.0.0.0/0"]
}
