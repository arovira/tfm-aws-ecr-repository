# AWS ECR Terraform module

Terraform module which creates AWS ECR resources.

### Usage

```hcl
module "ecr_repo" {
  source   = "git::git@github.com:arovira/tfm-aws-ecr-repository.git"
  ecr_name = "example"
}
```

## Examples

Examples codified under the [`examples`](https://github.com/arovira/tfm-aws-ecr-repository/tree/main/examples) are intended to give users references for how to use the module(s) as well as testing/validating changes to the source code of the module. If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow maintainers to test your changes and to keep the examples up to date for users. Thank you!


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.ecr_repo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.ecr_repo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.ecr_repo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_ecr_encryption_type"></a> [aws\_ecr\_encryption\_type](#input\_aws\_ecr\_encryption\_type) | Encryption type for ECR | `string` | `"KMS"` | no |
| <a name="input_aws_ecr_lifecycle_policy_rules"></a> [aws\_ecr\_lifecycle\_policy\_rules](#input\_aws\_ecr\_lifecycle\_policy\_rules) | List of ECR Lifecycle rules to be created | `list(any)` | <pre>[<br>  {<br>    "action": {<br>      "type": "expire"<br>    },<br>    "description": "Expire images older than 30 days",<br>    "rulePriority": 1,<br>    "selection": {<br>      "countNumber": 30,<br>      "countType": "sinceImagePushed",<br>      "countUnit": "days",<br>      "tagStatus": "untagged"<br>    }<br>  }<br>]</pre> | no |
| <a name="input_aws_kms_encryption_key"></a> [aws\_kms\_encryption\_key](#input\_aws\_kms\_encryption\_key) | Encryption kms key for ECR. Leave blank for ECR managed key. | `string` | `""` | no |
| <a name="input_ecr_image_tag_mutability"></a> [ecr\_image\_tag\_mutability](#input\_ecr\_image\_tag\_mutability) | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE. | `string` | `"MUTABLE"` | no |
| <a name="input_ecr_name"></a> [ecr\_name](#input\_ecr\_name) | Name of the ECR repository to be created | `string` | n/a | yes |
| <a name="input_enable_access_from_external_account"></a> [enable\_access\_from\_external\_account](#input\_enable\_access\_from\_external\_account) | If True, enable access from other aws accounts | `bool` | `false` | no |
| <a name="input_external_account_access"></a> [external\_account\_access](#input\_external\_account\_access) | Only used if enable\_access\_from\_external\_account is true. Accounts that should have access to this repo. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
