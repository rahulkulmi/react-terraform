data "aws_acm_certificate" "np" {
  domain      = var.certificate_name
  most_recent = true
}

# data "aws_route53_zone" "np" {
#   provider = aws.dns
#   name     = var.hosted_zone_name
# }
