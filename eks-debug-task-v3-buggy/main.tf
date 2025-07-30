provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

locals {
  availability_zones = ["us-east-1a", "us-east-1b"]
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet("10.0.0.0/16", 8, count.index)
  availability_zone = local.availability_zones[count.index + 1] // ❌ index out of bounds at count.index = 1
}

resource "aws_eks_cluster" "demo" {
  name     = "eks-demo"

  vpc_config {
    subnet_ids = aws_subnet.private.id // ❌ should be aws_subnet.private[*].id
  }

  role_arn = aws_iam_role.eks_cluster_role // ❌ missing `.arn`

  version = var.eks_ver // ❌ var.eks_ver is never declared

  // ❌ Missing depends_on
}
