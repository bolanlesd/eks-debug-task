terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "handons-terraform-backend"
    key    = "state/eks.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.region
}
