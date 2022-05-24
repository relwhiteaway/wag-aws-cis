resource "aws_iam_role" "wag-admin" {
  name               = "wag-admin"
  assume_role_policy = data.aws_iam_policy_document.wag-admin-assume-role.json
}

data "aws_iam_policy_document" "wag-admin-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.account_id}:root"]
    }
  }
}

data "aws_iam_policy" "adminstrator_access" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "admin_attach_administrator_access" {
  role       = aws_iam_role.wag-admin.name
  policy_arn = data.aws_iam_policy.adminstrator_access.arn
}

resource "aws_iam_group" "wag-admin" {
  name = "wag-admin"
}

resource "aws_iam_group_membership" "admin" {
  name = "admin-membership"

  users = [
    "rel@whiteaway.com",
    "tia@whiteaway.com",
    "smh@whiteaway.com",
    "mal@whiteaway.com"
  ]

  group = aws_iam_group.wag-admin.name
}

resource "aws_iam_group_policy" "allow_assume_admin_role" {
  group  = aws_iam_group.wag-admin.name
  name   = "assume-wag-admin-role"
  policy = data.aws_iam_policy_document.allow_assume_admin_role_policy.json
}

data "aws_iam_policy_document" "allow_assume_admin_role_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.wag-admin.arn]
  }
}

