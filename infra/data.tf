provider "aws" {
  alias      = "virginia"
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

data "aws_acm_certificate" "ssl_cert" {
  domain      = var.certificate_name
  most_recent = true
  statuses    = ["ISSUED"]
  provider    = aws.virginia
}

data "aws_route53_zone" "np" {
  # provider = aws.dns
  name = var.hosted_zone_name
}
