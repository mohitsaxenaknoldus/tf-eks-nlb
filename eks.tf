resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.21"

  vpc_config {
    subnet_ids         = ["subnet-6e132a43", "subnet-8bf51cc3"]
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "eks_node_role_arn"
  subnet_ids      = ["subnet-6e132a43", "subnet-8bf51cc3"]
  scaling_config {
    desired_size = 2
    max_size     = 10
    min_size     = 1
  }
  depends_on = [aws_eks_cluster.my_cluster]
}
