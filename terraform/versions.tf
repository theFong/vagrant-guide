provider "aws" {
  profile = var.aws_profile
}

terraform {
  required_version = ">= 0.14.11"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.38"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 2.0"
    }
  }
}
