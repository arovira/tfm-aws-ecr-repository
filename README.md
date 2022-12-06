# AWS ECR Terraform module

Terraform module which creates AWS ECR resources.

### Repository

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.22 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.22 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="ecr_name"></a> [ecr\_name](#ecr\_name) | The name of the repository | `string` | `""` | yes |
| <a name="ecr_image_tag_mutability"></a> [ecr\_image\_tag\_mutability](#ecr\_image\_tag\_mutability) | The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE`. Defaults to `MUTABLE` | `string` | `"MUTABLE"` | no |
| <a name="enable_access_from_external_account"></a> [enable\_access\_from\_external\_account](#enable\_access\_from\_external\_account) | Enable access from other AWS accounts. Must be one of: `false` or `true`. Defaults to `false` | `bool` | `"false"` | no |
| <a name="external_account_access"></a> [external\_account\_access](#external\_account\_access) | List of AWS account ids to grant access to the repo | `list(string)` | `[]` | no |
| <a name="aws_ecr_lifecycle_policy_rules"></a> [aws\_ecr\_lifecycle\_policy\_rules](#aws\_ecr\_lifecycle\_policy\_rules) | List lifecycle repo rules. Defaults to delete untagged after 30 days | `list(any)` | NA | no |
| <a name="aws_ecr_encryption_type"></a> [aws\_ecr\_encryption\_type](#aws\_ecr\_encryption\_type) | he encryption type for the repository. Must be one of: `KMS` or `AES256`. Defaults to `KMS` | `string` | `null` | no |
| <a name="aws_kms_encryption_key"></a> [aws\_kms\_encryption\_key](#aws\_kms\_encryption\_key) | The ARN of the KMS key to use when encryption\_type is `KMS`. If not specified, uses the default AWS managed key for ECR | `string` | `null` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="repository_url"></a> [repository\_url](#output\_repository\_url) | The URL of the repository |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
