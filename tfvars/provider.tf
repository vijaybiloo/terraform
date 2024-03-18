terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.39.1"
    }
  }

backend "s3" {
  bucket = "roboshop-bucket-remote-state"
  key      = "global/s3/terraform.tfstate"
  region = "us-east-1"
  dynamodb_table = "roboshop-locking"
  }
}


provider "aws" {
  # Configuration options
  # We can access key and secret key but we have sucerity issues
  region = "us-east-1"
}