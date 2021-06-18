resource "random_string" "dynamodb_random_name" {
  length           = 8
  special          = false
  min_lower        = 8
}
resource "aws_dynamodb_table" "terraform_locks" {
   name = "terraform-up-and-running-${random_string.dynamodb_random_name.result}"
   billing_mode = "PAY_PER_REQUEST"
   hash_key = "LockID"

   attribute {
       name = "LockID"
       type = "S"
   }
}