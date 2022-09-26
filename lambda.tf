# ** Terraform Lambda **

# File: lambda.tf
# Description: The following Terraform resources create a Lambda function named CreateMessageHandler and packs it in a .zip file

data "archive_file" "lambda_message" {
  type        = "zip"
  source_file = var.source_file
  output_path = var.output_path
}

resource "aws_lambda_function" "message" {
  description   = "Takes an incoming API Gateway Event"
  function_name = var.aws_lambda_function_name
  filename      = data.archive_file.lambda_message.output_path
  runtime       = "nodejs12.x"
  handler       = "${var.aws_lambda_function_name}.handler"
  role          = aws_iam_role.lambda_exec.arn
}

resource "aws_iam_role" "lambda_exec" {
  name = "message-new"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      }
    ]
  })
}

data "template_file" "messagelambdapolicy" {
  template = "${file("aws-policies/dynamodb.json")}"
}

resource "aws_iam_policy" "MessageLambdaPolicy" {
  name        = "MessageLambdaPolicy"
  path        = "/"
  description = "IAM policy for Message lambda functions"
  policy      = data.template_file.messagelambdapolicy.rendered
}

resource "aws_iam_role_policy_attachment" "MessageLambdaRolePolicy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.MessageLambdaPolicy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}