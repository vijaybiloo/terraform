terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.39.1"
    }
  }
}

provider "aws" {
  # Configuration options
  # We can access key and secret key but we have sucerity issues
  region = "us-east-1"
}