module "vpc" {
  source = "./vpc"
}

module "eks_cluster" {
  source = "./eks_cluster"
}
