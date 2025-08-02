output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "public_ingress_sg_id" {
  value = aws_security_group.public_ingress.id
}

output "eks_worker_sg_id" {
  value = aws_security_group.eks_worker.id
}