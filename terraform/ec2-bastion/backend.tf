terraform {
  backend "s3" {
    bucket         = "kotak-assignment-terraform-bucket"
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock-kotak-assignment"
  }
}