module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eks-cluster"
  cluster_version = "1.21"
  subnet_ids      = module.vpc.private_subnet_ids  // Invalid reference
  vpc_id          = module.vpc.vpc_id              // Invalid reference
  enable_irsa     = true
  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }
  manage_aws_auth_configmap = true
  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }
}
