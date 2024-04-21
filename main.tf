
resource "aws_instance" "my_first_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}


resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = var.tag_name
    Environment = var.env
    Team        = var.team
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = var.bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}

//s3 bucket for storage
// kms key for encryption
resource "aws_kms_key" "a" {
  description             = "Terraform kms key for encryption"
  deletion_window_in_days = var.deletion_window
}

resource "aws_kms_alias" "a" {
  name          = "alias/wild/tfstate/${var.env}/${var.region}/s3/key"
  target_key_id = aws_kms_key.a.key_id
}

// dynamodb for locking the state file 
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  deletion_protection_enabled = var.delete_protect

  tags = {
    Name        = "dynamodb-table-1"
    Environment = var.env
  }
}

