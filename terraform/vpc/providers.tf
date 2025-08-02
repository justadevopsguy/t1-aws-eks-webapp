terraform {
  required_version = ">= 1.12.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "t1-terraform-bucket"
    key            = "aws/terraform/vpc/telite-vpc.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}
