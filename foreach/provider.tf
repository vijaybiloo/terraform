terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.39.1"
    }
  }

# I didnt add the S3 bucket and Dynamo DB in AWS clould because they might charge me more money hence have commented the backend s3.
# ans can be used for reference 


/* backend "s3" {
  bucket = "roboshop-remote-state"
  key = "foreach-demo"
  region = "us-east-1"
  dynamodb_table = "roboshop-locking"
  }

} */

}
provider "aws" {
  # Configuration options
  # We can access key and secret key but we have sucerity issues
  region = "us-east-1"
}