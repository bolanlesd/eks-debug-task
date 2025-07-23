output "cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}

output "private_subnets" {
  value = module.vpc.private_subnet_ids
}
