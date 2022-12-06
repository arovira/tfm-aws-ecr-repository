module "ecr_repo" {
  source                                       = "git::git@github.com:arovira/tfm-aws-ecr-repository.git"
  ecr_name                                     = "example-allow-from-xxxxxxxxxxxx-account"
  enable_access_from_external_account_clusters = true
  external_account_access                      = ["arn:aws:iam::xxxxxxxxxxxx:root"]
}
