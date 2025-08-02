terraform {
  required_version = ">= 1.12.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "t1-terraform-bucket"
    key            = "aws/terraform/eks/telite-eks.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-southeast-2"
}
