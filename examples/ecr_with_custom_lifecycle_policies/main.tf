
module "ecr_repo" {
  source   = "git::git@github.com:arovira/tfm-aws-ecr-repository.git"
  ecr_name = "example-with-custom-policies"
  aws_ecr_lifecycle_policy_rules = [
    {
      description  = "Expire images older than 30 days",
      rulePriority = 1,
      selection = {
        tagStatus   = "untagged"
        countType   = "sinceImagePushed"
        countUnit   = "days"
        countNumber = 30
      }
      action = {
        type = "expire"
      }
    }
  ]
}
