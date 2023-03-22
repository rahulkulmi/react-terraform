data "aws_acm_certificate" "ssl_cert" {
  domain      = var.certificate_name
  most_recent = true
  statuses    = ["ISSUED"]
}

data "aws_route53_zone" "main" {
  # provider = aws.dns
  name = var.hosted_zone_name
}
