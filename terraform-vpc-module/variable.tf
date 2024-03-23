variable "cidr_block" {
  #default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  default = true
}

variable "enable_dns_support" {
  default = true
}

variable "common_tags" {
  type  = map 
  default = {} # this means tags is optional
}

variable "vpc_tags" {
  type = map
  default = {} # this means tags is optional
}

variable "igw_tags" {
  default = {} # this means tags is optional
}

variable "public_subnet_cidr" {

}

variable "public_subnet_names"{

}

variable "azs" {

}

variable "private_subnet_cidr" {

}

variable "private_subnet_names"{

}

variable "database_subnet_cidr" {

}

variable "database_subnet_names"{

}

variable "public_route_table_tags" {
  default = {} # this means tags is optional
}

variable "private_route_table_tags" {
  default = {} # this means tags is optional
}

variable "database_route_table_tags" {
  default = {} # this means tags is optional
}