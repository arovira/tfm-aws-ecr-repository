resource "aws_ecr_repository" "ecr_repo" {
  name                 = var.ecr_name
  image_tag_mutability = var.ecr_image_tag_mutability

  encryption_configuration {
    encryption_type = var.aws_ecr_encryption_type
    kms_key         = var.aws_kms_encryption_key
  }

  image_scanning_configuration {
    scan_on_push = true
  }

}

resource "aws_ecr_lifecycle_policy" "ecr_repo" {
  repository = aws_ecr_repository.ecr_repo.name

  depends_on = [
    aws_ecr_repository.ecr_repo,
  ]

  policy = jsonencode(
    {
      rules = var.aws_ecr_lifecycle_policy_rules
    }
  )

}

# Allow access from different clusters:
resource "aws_ecr_repository_policy" "ecr_repo" {

  count = var.enable_access_from_external_account_clusters ? 1 : 0

  repository = aws_ecr_repository.ecr_repo.name

  depends_on = [
    aws_ecr_repository.ecr_repo,
  ]

  policy = jsonencode(
    {
      "Version" : "2008-10-17",
      "Statement" : [
        {
          "Sid" : "Allow AWS accounts access",
          "Effect" : "Allow",
          "Principal" : {
            "AWS" : var.external_account_access
          },
          "Action" : [
            "ecr:BatchCheckLayerAvailability",
            "ecr:BatchGetImage",
            "ecr:GetDownloadUrlForLayer"
          ]
        }
      ]
    }
  )
}
