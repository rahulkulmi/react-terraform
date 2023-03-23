locals {
  #   tags = merge(module.tags.tags, var.additional_tags)
  s3OriginId = "origin-${aws_s3_bucket.website.bucket}"

  additional_tags = {
    repo        = var.repo
    project     = var.project
    app_version = var.app_version
    environment = var.stage
  }

}

# module "tags" {
#   repo              = var.repo
#   project           = var.project
#   app_version       = var.app_version
#   environment       = var.stage
# #   terraform_version = var.tf_version
# }
