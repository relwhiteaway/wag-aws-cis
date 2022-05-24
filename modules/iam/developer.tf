/*
resource "aws_iam_role" "wag-developer" {
  name               = "wag-developer"
  assume_role_policy = data.aws_iam_policy_document.wag-developer-assume-role.json
}

data "aws_iam_policy_document" "wag-developer-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.account_id}:root"]
    }
  }
}

data "aws_iam_policy" "readonly_access" {
  name = "ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "developer_attach_readonly_access" {
  role       = aws_iam_role.wag-developer.name
  policy_arn = data.aws_iam_policy.readonly_access.arn
}

resource "aws_iam_group" "wag-developer" {
  name = "wag-developer"
}

resource "aws_iam_group_policy" "allow_assume_developer_role" {
  group  = aws_iam_group.wag-developer.name
  name   = "assume-wag-developer-role"
  policy = data.aws_iam_policy_document.allow_assume_developer_role_policy.json
}

data "aws_iam_policy_document" "allow_assume_developer_role_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.wag-developer.arn]
  }
}
*/