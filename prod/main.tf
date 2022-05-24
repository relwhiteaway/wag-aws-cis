terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "wag-terraform-state-securityhub"
    profile        = "wag-securityhub"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-lock"
    key            = "terraform-securityhub"
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "wag-securityhub"

}

resource "aws_organizations_account" "securityhub" {
      email            = "rel@whiteaway.com"
      name             = "securityhub"
}
