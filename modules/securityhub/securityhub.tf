resource "aws_securityhub_account" "securityhub" {}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_benchmark" {
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
}

/* enable on all new accounts
resource "aws_securityhub_organization_configuration" "securityhub_configuration" {
  auto_enable = true
}
*/

/**members*/
/*
resource "aws_securityhub_member" "datalake-dev" {
  depends_on = [aws_securityhub_account.securityhub]
  account_id = "118825188227"
  email      = "rel@whiteaway.com"
  invite     = true
}
*/
data "aws_region" "current" {}
resource "aws_securityhub_member" "datalake-test" {
  depends_on = [aws_securityhub_account.securityhub]
  account_id = "921653879770"
  email      = "rel@whiteaway.com"
  invite     = true
}



resource "aws_securityhub_member" "main" {
  depends_on = [aws_securityhub_account.securityhub]
  account_id = "533026789209"
  email      = "rel@whiteaway.com"
  invite     = true
}