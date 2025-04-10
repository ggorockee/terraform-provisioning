# resource "aws_ecr_repository" "demoapp" {
#   name = "demoapp"

#   image_scanning_configuration {
#     scan_on_push = true
#   }

#   image_tag_mutability = "IMMUTABLE"
# }

# resource "aws_ecr_repository_policy" "demoapp" {
#   repository = aws_ecr_repository.demoapp.name

#   policy = jsonencode({
#     "Version" : "2008-10-17",
#     "Statement" : [
#       {
#         "Effect" : "Allow",
#         "Principal" : {
#           "AWS" : [
#             "arn:aws:iam::${var.account_id.id}:root",
#           ]
#         },
#         "Action" : [
#           "ecr:GetDownloadUrlForLayer",
#           "ecr:BatchGetImage",
#           "ecr:BatchCheckLayerAvailability",
#           "ecr:DescribeRepositories",
#           "ecr:GetRepositoryPolicy",
#           "ecr:ListImages"
#         ]
#       }
#     ]
#   })
# }
