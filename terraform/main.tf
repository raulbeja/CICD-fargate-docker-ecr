provider "aws" {
  region = var.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.30"
    }
  }

  backend "s3" {
    bucket = "rbgsandbox"
    key    = "tryme.tfstatefile"
    region = "us-east-1"
  }
}