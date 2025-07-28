module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "20.37.0"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  enable_irsa = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  eks_managed_node_groups = {
    one = {
      desired_size = 1
      max_size     = 2
      min_size     = 1
      instance_types   = ["t3.medium"]
    }
  }
}


module "aws_auth" {
  source                    = "terraform-aws-modules/eks/aws//modules/aws-auth"
  version                   = "20.31.6"
  create_aws_auth_configmap = true
  manage_aws_auth_configmap = true

  depends_on = [
    module.eks,
  ]
}