locals {
  enc = var.kms_key_arn != "" ? {
    encryption_type = "KMS"
    kms_key         = var.kms_key_arn
  } : {
    encryption_type = "AES256"
  }
}

resource "aws_ecr_repository" "this" {
  for_each             = toset(var.names)
  name                 = each.value
  image_tag_mutability = var.immutable ? "IMMUTABLE" : "MUTABLE"

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  encryption_configuration {
    encryption_type = local.enc.encryption_type
    kms_key         = try(local.enc.kms_key, null)  # null => se omite con AES256
  }

  tags = var.tags
}


resource "aws_ecr_lifecycle_policy" "this" {
  for_each   = aws_ecr_repository.this
  repository = each.value.name
  policy = jsonencode({
    rules = [{
      rulePriority = 1,
      description  = "Keep last ${var.keep_last} images",
      selection = { tagStatus = "any", countType = "imageCountMoreThan", countNumber = var.keep_last },
      action    = { type = "expire" }
    }]
  })
}
