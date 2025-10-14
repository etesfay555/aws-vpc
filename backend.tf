terraform {
  required_version = "~> 1.13"
  backend "remote" {
    organization = "demo-land"
    workspaces {
      name = "aws-vpc"
    }
  }
}
