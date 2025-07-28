module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.37.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id
  enable_irsa     = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }
  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      ami_type       = "AL2_x86_64"
      min_size       = 1
      max_size       = 2
      desired_size   = 2
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