data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "t1-terraform-bucket"
    key    = "aws/terraform/vpc/telite-vpc.tfstate"
    region = "ap-southeast-2"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name    = var.cluster_name
  kubernetes_version = var.cluster_version

  vpc_id                   = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids               = data.terraform_remote_state.vpc.outputs.private_subnets
  control_plane_subnet_ids = data.terraform_remote_state.vpc.outputs.public_subnets

  endpoint_public_access = true
  enable_cluster_creator_admin_permissions = true
  
  eks_managed_node_groups = {
    main = {
      name = "${var.cluster_name}-node-group"
      instance_types = ["t3.micro"]
      capacity_type  = "ON_DEMAND"
      min_size     = 1
      max_size     = 1
      desired_size = 1
      ami_type     = "AL2023_x86_64_STANDARD"
      disk_size    = 20
      tags = var.common_tags
    }
  }
  tags = var.common_tags
}
