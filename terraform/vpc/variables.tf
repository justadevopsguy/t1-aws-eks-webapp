variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "telite-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.10.0.0/20"
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]
}

variable "database_subnets" {
  description = "Database subnet CIDR blocks"
  type        = list(string)
  default     = ["10.10.6.0/24", "10.10.7.0/24", "10.10.8.0/24"]
}

variable "common_tags" {
  description = "Common tags for resources"
  type        = map(string)
  default     = {
    Environment = "production"
    Project     = "telite"
  }
}
