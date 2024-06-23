module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

name                 = "eks-vpc"
cidr                 = var.vpc_cidr
private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets       = ["10.0.4.0/24", "10.0.5.0/24"]
enable_nat_gateway   = true
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_cidr" {
  default= "10.0.0.0/16"
}
