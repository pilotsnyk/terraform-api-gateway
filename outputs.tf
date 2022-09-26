# ** Terraform Outputs **

# File: outputs.tf
# Description: The following are the Terraform output values of such resources I consider useful

output "function_name" {
  description = "Name of the Lambda function."
  value = aws_lambda_function.message.function_name
}

output "base_url" {
  description = "Base URL for API Gateway stage."
  value = aws_apigatewayv2_stage.lambda.invoke_url
}

output "dynamodb_table" {
  description = "Name of the table in DynamoDB."
  value = aws_dynamodb_table.MessageHistory.id
}
