resource "aws_iam_role" "assume_id_admin" {
  name                 = "assume-id-admin"
  path                 = "/"
  max_session_duration = "43200" # 12시간
  assume_role_policy   = data.aws_iam_policy_document.assume_id_admin_assume_role.json
}

data "aws_iam_policy_document" "assume_id_admin_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id.id}:root"]
    }
  }
}

resource "aws_iam_role_policy" "admin_full_access" {
  name   = "admin_full_access"
  role   = aws_iam_role.assume_id_admin.id
  policy = data.aws_iam_policy_document.admin_full_access.json
}

data "aws_iam_policy_document" "admin_full_access" {
  statement {
    actions   = ["*"]
    effect    = "Allow"
    resources = ["*"]
  }
}

# resource "aws_iam_role_policy_attachment" "assume_id_admin" {
#   role       = aws_iam_role.assume_id_admin.id
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
# }
