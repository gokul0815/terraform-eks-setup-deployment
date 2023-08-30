resource "aws_s3_bucket" "kotak-assignment-terraform-bucket" {
    bucket = "kotak-assignment-terraform-bucket"
    acl = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.kotak-assignment-terraform-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_dynamodb_table" "terraform-state-lock-kotak-assignment" {
  name = "terraform-state-lock-kotak-assignment"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}