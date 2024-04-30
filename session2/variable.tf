variable "instance_names" {
    type = list
    default = ["MongoDB", "cart", "catalogue", "user", "redis", "mysql", "rabbitmq", "shipping", "payment", "dispatch", "web-nginx"]

}

variable "ami_id" {
  type = string # this is data types
  default = "ami-0f3c7d07486cad139" # default value for devops-practice 
}

variable "zone_id" {
    default = "Z0630267198Z1Q0Y8S23T"
}

variable "domain" {
  type = string
  default = "jiondevops.site"
}