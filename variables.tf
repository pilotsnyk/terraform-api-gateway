# ** Terraform Variables **

# File: variables.tf
# Description: The following Terraform variabels are declarations of input values that let me customize aspects of Terraform

# ----- AWS CONFIGURATION VARIABLES ----- #

variable "aws_region" {
  type        = string
  default     = "eu-west-1"
  description = "The AWS region to create things in."
}

variable "aws_account_id" {
  type        = string
  default     = "123456789"
  description = "The AWS region to create things in."
}

# ----- AWS LAMBDA CONFIGURATION VARIABLES ----- #

variable "source_file" {
  description = "The path of the lambda function js file"
  type        = string
  default     = "lambda/message-new.js"
}

variable "output_path" {
  description = "The path of the lambda function zip file"
  type        = string
  default     = "lambda/message-new.zip"
}

variable "aws_lambda_function_name" {
  description = "A unique name for your Lambda Function."
  type        = string
  default     = "message-new"
}


# ----- AWS API GATEWAY CONFIGURATION VARIABLES ----- #

variable "aws_api_gateway_rest_api_name" {
  description = "The name of the REST API"
  type        = string
  default     = "message"
}

variable "aws_api_gateway_rest_api_description" {
  description = "Description of the REST API"
  type        = string
  default     = "Message New API Gateway"
}

variable "aws_api_gateway_resource_path_path" {
  description = "The last path segment of this API resource."
  type        = string
  default     = "new"   
}

variable "aws_api_gateway_http_method" {
  description = "The HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  type        = string
  default     = "POST"     
}

variable "aws_api_gateway_auth_method" {
  description = "The type of authorization used for the method (NONE, CUSTOM, AWS_IAM, COGNITO_USER_POOLS)"
  type        = string
  default     = "NONE"     
}

# ----- AWS DYNAMODB CONFIGURATION VARIABLES ----- #

variable "aws_dynamodb_table" {
  description = "The name of the dynamodb table"
  type        = string
  default     = "MessageHistory"
}

variable "aws_dynamodb_read_capacity" {
  description = "The number of read units for this table"
  type        = string
  default     = "10"
}

variable "aws_dynamodb_write_capacity" {
  description = "The number of write units for this table"
  type        = string
  default     = "15"
}

variable "aws_dynamodb_billing_mode" {
  description = "Controls the costs for read and write throughput and its capacity"
  type        = string
  default     = "PROVISIONED"
}

variable "aws_dynamodb_hash_key" {
  description = "The attribute to use as a hash or partition key"
  type        = string
  default     = "UserId"
}

variable "aws_dynamodb_sort_key" {
  description = "The attribute to use as the range (sort) key"
  type        = string
  default     = "Timestamp"
}

variable "aws_dynamodb_table_types" {
  type    =  map(string)
  default = {
      "UserId"      = "S"
      "Timestamp"   = "S"
      "MessageText" = "S"
  }
}
