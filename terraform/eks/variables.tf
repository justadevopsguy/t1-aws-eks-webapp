variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "telite-eks"
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.33"
}

variable "common_tags" {
  description = "Common tags for resources"
  type        = map(string)
  default     = {
    Environment = "production"
    Project     = "telite"
  }
}