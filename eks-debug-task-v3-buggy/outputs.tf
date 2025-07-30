output "eks_cluster_endpoint" {
  value = aws_eks_cluster.demo.endpoint // ❌ wrong property
}
