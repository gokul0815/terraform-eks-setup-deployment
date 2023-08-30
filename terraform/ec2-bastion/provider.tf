provider "aws" {
  region                 = "ap-south-1"
  #version                = "~> 3.0"
  default_tags {
    tags = var.default_tags
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}