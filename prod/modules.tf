/*

module "account" {
  source       = "git@github.com:whiteaway/infrastructure-terraform-modules.git//aws-account?ref=v1.2.0"
  env          = var.env
  account_name = "securityhub"
}

module "account-iam" {
  source = "../modules/iam"
}
*/
module "main_budget" {
  source = "../modules/budget"

  limit_amount = var.budget_limit
}

module "securityhub" {
  source = "../modules/securityhub"

}
