variable "cidr_block" {
  default     = "0.0.0.0/16"
}

variable "common_tags" {
  default     = {
    Project = "roboshop"
    Environment = "DEV"
    Terraform = true
    
 }
}

variable "vpc_tags" {
  default = {
    Name = "roboshop"
    
 }
}

variable "igw_tags" {
  default = {
    Name = "roboshop"
  }
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"] 
}

variable "azs" {
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_names" {
  default     = ["roboshop-public-1a", "roboshop-public-1b"]
}

variable "private_subnet_cidr" {
  default = ["10.0.11.0/24", "10.0.12.0/24"] 
}

variable "private_subnet_names" {
  default     = ["roboshop-private-1a", "roboshop-private-1b"]
}

variable "database_subnet_cidr" {
  default = ["10.0.21.0/24", "10.0.22.0/24"] 
}

variable "database_subnet_names" {
  default     = ["roboshop-database-1a", "roboshop-database-1b"]
}