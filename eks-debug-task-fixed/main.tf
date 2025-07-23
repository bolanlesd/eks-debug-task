module "vpc" {
  source   = "./vpc"
  region   = var.region
  vpc_name = "eks-debug-vpc"
}

module "eks_cluster" {
  source          = "./eks_cluster"
  cluster_name    = "eks-debug-cluster"
  subnet_ids      = module.vpc.private_subnet_ids
  vpc_id          = module.vpc.vpc_id
  cluster_version = var.cluster_version
}
