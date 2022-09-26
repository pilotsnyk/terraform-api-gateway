# ** Terraform Dynamodb **

# File: dynamodb.tf
# Description: The following Terraform resources create a DynamoDB Table named MessageHistory with:
#  - Partition key: name: UserId, type: STRING
#  - Sort key: name: Timestamp, type: STRING

resource "aws_dynamodb_table" "MessageHistory" {
  name           = var.aws_dynamodb_table
  hash_key       = var.aws_dynamodb_hash_key
  range_key      = var.aws_dynamodb_sort_key
  read_capacity  = var.aws_dynamodb_read_capacity
  write_capacity = var.aws_dynamodb_write_capacity
  billing_mode   = var.aws_dynamodb_billing_mode

  attribute {
    name = var.aws_dynamodb_hash_key
    type = var.aws_dynamodb_table_types[var.aws_dynamodb_hash_key]
  }
  
  attribute {
    name = var.aws_dynamodb_sort_key
    type = var.aws_dynamodb_table_types[var.aws_dynamodb_sort_key]
  }
  
  tags = {
    Name        = var.aws_dynamodb_table
    Environment = "Development"
  }
}

