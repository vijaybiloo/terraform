variable "ami_id" {
  type = string # this is data types
  default = "ami-0f3c7d07486cad139" # default value for devops-practice 
}

variable "instance_type" {
    #type = string
    default = "t2.micro"
}

variable "sg_name" {
    type = string
    default = "allow_all"
}

variable "sg_cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "tags" {
    type = map
    default = {
      Name = "mongodb"
        Environment = "DEV"
        Terraform = "true"
        Project = "Roboshop"
        Component = "mongodb"
    }

}