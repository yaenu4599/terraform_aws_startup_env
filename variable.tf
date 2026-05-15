# =============================================================================
# tag
# =============================================================================

variable "environment" {
  description = "environment name for tagging"
  type        = string
  default     = "dev"
}

variable "managedby" {
  description = "tag used to narrow down permissions"
  type        = string
  default     = "terraform"
}

variable "project" {
  description = "tag to filter aws resources and for a better cost overview"
  type        = string
  default     = "terraform_aws_startup_env"
}

# =============================================================================
# module.vpc
# =============================================================================

variable "vpc_cidr" {
  description = "cidr block to deploy the vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "wich azs should be available in ur region"
  type        = list(string)
  default     = ["eu-central-1a"]
}

variable "subnet_public_cidrs" {
  description = "because we only want one public subnet only one cidr block"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

# =============================================================================
# module.ec2instance
# =============================================================================

variable "instance_type" {
  description = "instance type to create a instance"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "ami id to create a instance"
  type        = string
  default     = "ami-08bdb1495db49a7f9"
}

# =============================================================================
# module.s3
# =============================================================================

variable "bucket_name" {
  description = "unique name to create the bucket(give name in tvfars)"
  type        = string
}