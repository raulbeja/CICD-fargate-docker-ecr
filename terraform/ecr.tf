resource "aws_ecr_repository" "repository" {
  name = var.ecr_name
  image_tag_mutability = var.ecr_image_mutability

  image_scanning_configuration {
    scan_on_push = false
  }

  tags = local.common_tags
}

resource "aws_ecr_lifecycle_policy" "main" {
  repository = aws_ecr_repository.repository.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "keep last 3 images"
      action       = {
        type = "expire"
      }
      selection     = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 3
      }
    }]
  })
}