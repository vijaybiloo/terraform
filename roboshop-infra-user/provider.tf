terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.39.1"
    }
  }

backend "s3" {
  bucket = "roboshop-bucket-remote-state-prod"
  key      = "global/s3/vpc-module"
  region = "us-east-1"
  dynamodb_table = "roboshop-locking-prod"
  }
}


provider "aws" {
  # Configuration options
  # We can access key and secret key but we have sucerity issues
  region = "us-east-1"
}