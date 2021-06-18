resource "random_string" "bucket_random_name" {
  length           = 8
  special          = false
  min_lower        = 8
}

resource "aws_s3_bucket" "terraform-state" {
  bucket = "my-tf-state-bucket-${random_string.bucket_random_name.result}"
  acl    = "private"

  tags = {
    Name        = "Terraform state bucket"
    Environment = "Learning"
  }

  lifecycle {
      prevent_destroy = true
  }
  #Enable terraform to version control the tfstate
  versioning {
    enabled = true
  }
  # Enable server side encryption 
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
      }
    }
  }
}