module "vpc" {
  source   = "./vpc"
  for_each = toset(["network"])
}

module "eks_cluster" {
  source          = "./eks_cluster"
  cluster_name    = "eks-cluster"
  subnet_ids      = module.vpc["network"].private_subnet_ids
  vpc_id          = module.vpc["network"].vpc_id
  cluster_version = var.cluster_version
}
