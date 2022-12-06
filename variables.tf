
variable "ecr_name" {
  description = "Name of the ECR repository to be created"
  type        = string
}

variable "ecr_image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE."
  default     = "MUTABLE"
  type        = string
}

variable "enable_access_from_external_account_clusters" {
  description = "If True, enable access from other aws accounts"
  default     = false
  type        = bool
}

variable "external_account_access" {
  description = "Only used if enable_access_from_external_account_clusters is true. Accounts that should have access to this repo."
  default = []
  type = list(any)
}

variable "aws_ecr_lifecycle_policy_rules" {
  description = "List of ECR Lifecycle rules to be created"
  type        = list(any)
  default = [
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

variable "aws_ecr_encryption_type" {
  description = "Encryption type for ECR"
  type        = string
  default     = "KMS"
}

variable "aws_kms_encryption_key" {
  description = "Encryption kms key for ECR. Leave blank for ECR managed key."
  type        = string
  default     = ""
}