variable "instance_names" {
    type = list
    default = ["MongoDB", "cart", "catalogue", "user", "redis", "mysql", "rabbitmq", "shipping", "payment", "dispatch", "web-nginx"]

}

variable "ami_id" {
  type = string # this is data types
  default = "ami-0f3c7d07486cad139" # default value for devops-practice 
}

variable "zone_id" {
    default = "Z01884332TBS4FMFS9HVB"
}

variable "domain" {
  type = string
  default = "vijaydeepak0812.online"
}