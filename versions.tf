# ** Terraform Versions **

# File: versions.tf
# Description: The following blocks let us gather together the Terraform settings

# Providers options

provider "aws" {
  access_key = ""
  secret_key = ""
  region     = var.aws_region
}

terraform {
  required_version = ">= 1.1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.6.0"
    }
  }
}
