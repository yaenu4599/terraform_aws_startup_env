terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  required_version = "~> 1.15.0"
}

provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-bucked-v1"
    key    = "terraform/backend/terraform_backend_bucked_v1"
    region = "eu-central-1"
  }
}