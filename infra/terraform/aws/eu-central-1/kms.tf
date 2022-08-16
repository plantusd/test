resource "aws_kms_key" "terraform_state" {
  description             = "KMS key 1"
  key_usage="ENCRYPT_DECRYPT"
  deletion_window_in_days = 30
}

resource "aws_kms_key" "ecr_test_assignment" {
  description             = "KMS key 1"
  key_usage="ENCRYPT_DECRYPT"
  deletion_window_in_days = 30
}