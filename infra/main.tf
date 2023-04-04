module "website" {
  # source = "git::https://github.com/rahulkulmi/terraform-aws-s3.git"
  source = "git::https://github.com/rahulkulmi/terraform-aws-s3.git?ref=tags/v1.0.0"

  app_name          = var.app_name
  app_version       = var.app_version
  repo              = var.repo
  stage             = var.stage
  bucket_name       = var.bucket_name
  domain_name       = var.domain_name
  certificate_arn   = data.aws_acm_certificate.ssl_cert.arn
  hosted_zone_id    = data.aws_route53_zone.np.zone_id
  forwarded_headers = ["Origin", "Authorization", "Cache-Control", "Content-Type", "Expires"]
  # tags                  = local.tags
  # web_acl_id            = var.waf_name != null ? data.aws_waf_web_acl.on_prem[0].id : null
  # custom_error_response = var.custom_error_response

  # providers = {
  #   aws     = aws
  #   aws.dns = aws.dns
  # }
}
