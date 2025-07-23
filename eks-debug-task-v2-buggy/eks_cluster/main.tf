module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  enable_irsa = true
  manage_aws_auth_configmap = false

  node_groups = {
    one = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }

  # OIDC configuration left missing in buggy
}
