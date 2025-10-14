terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.16.0"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Owner       = "Eden"
      Purpose     = "Demo"
      Terraform   = true
      Environment = "development"
      DoNotDelete = true
      Name        = "Demo"
    }
  }

}
