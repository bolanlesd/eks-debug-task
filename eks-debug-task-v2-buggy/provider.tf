terraform {
  backend "s3" {
    bucket = "dummy-eks-bucket"
    key    = "state/eks.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}
