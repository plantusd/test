resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "TerraformStateLock"
  billing_mode = "PROVISIONED"

  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  server_side_encryption {
    kms_key_arn = aws_kms_key.terraform_state.arn
    enabled     = true
  }

  ttl {
    attribute_name = ""
    enabled        = false
  }

  attribute {
    name = "LockID"
    type = "S"
  }
}
