resource "aws_route53_zone" "main" {
  name    = var.domain_name
  comment = "${var.app_name}-${var.stage}"

  # tags {
  #   Environment = "production"
  # }
  tags = var.additional_tags
}

resource "aws_route53_record" "main-a-record" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

# resource "aws_route53_record" "main-c-name" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "www"
#   type    = "CNAME"
#   ttl     = "300"
#   records = ["${var.domain_name}"]
# }

