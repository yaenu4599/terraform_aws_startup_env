# =============================================================================
# modules
# =============================================================================

module "vpc" {
  source = "github.com/yaenu4599/terraform_aws_modules//modules/vpc?ref=v1.0.3"

  common_tags          = local.common_tags
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  subnet_public_cidrs  = var.subnet_public_cidrs
  subnet_private_cidrs = []
}

module "security_groups" {
  source = "github.com/yaenu4599/terraform_aws_modules//modules/security_groups?ref=v1.0.3"

  common_tags = local.common_tags
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  allow_ssh   = []
}

module "ec2instance" {
  source = "github.com/yaenu4599/terraform_aws_modules//modules/ec2instance?ref=v1.0.3"

  common_tags         = local.common_tags
  environment         = var.environment
  # public_key        = var.public_key
  instance_type       = var.instance_type
  ami_id              = var.ami_id
  subnet_ids          = module.vpc.subnets_public_ids
  security_group_id   = module.security_groups.security_group_public_id
  associate_public_ip = true

}

module "s3" {
  source = "github.com/yaenu4599/terraform_aws_modules//modules/s3?ref=v1.0.3"

  common_tags = local.common_tags
  environment = var.environment
  bucket_name = var.bucket_name
}