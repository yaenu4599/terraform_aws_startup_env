# =============================================================================
# tag
# =============================================================================

locals {
  environment = var.environment
  managedby   = var.managedby
  project     = var.project

  common_tags = {
    Environment = local.environment
    ManagedBy   = local.managedby
    Project     = local.project
  }
}
