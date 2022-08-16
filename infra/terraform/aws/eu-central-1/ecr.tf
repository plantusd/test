resource "aws_ecr_repository" "test-assignment" {
  name                 = "test-assignment"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }

  encryption_configuration {
    encryption_type = "KMS"
    kms_key = aws_kms_key.ecr_test_assignment.arn
  }
}