provider "aws" {
  region = var.aws_region # ❌ Undefined variable
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_eks_cluster" "demo" {
  name     = "eks-demo"

  vpc_config {
    subnet_ids = aws_subnet.private_a.id # ❌ Only one subnet (should be a list)
  }

  role_arn = aws_iam_role.eks_cluster_role # ❌ Missing `.arn`

  version = "1.30" # ❌ Invalid or future version

  # ❌ Missing depends_on
}
