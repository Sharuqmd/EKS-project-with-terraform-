module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.14.0"
  cluster_name    = "my-cluster"
  cluster_version = "1.29"
  subnet_ids      = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id

  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t2.micro"]
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
  }
  
  eks_managed_node_groups = {
    node_group = {
      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }
}
