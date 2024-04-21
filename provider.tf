provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "this-is-my-bucket-plz"
    key            = "wild/first-job/default.tfstate"
    encrypt        = true
    region         = "us-east-1"
    dynamodb_table = "tf-state-lock-with-dynamodb"
  }
}
