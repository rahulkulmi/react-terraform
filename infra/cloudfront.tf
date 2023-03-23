# AWS Cloudfront for caching

# resource "aws_cloudfront_origin_access_control" "this" {
#   name                              = "${var.app_name}-${var.stage}"
#   description                       = "${var.app_name}-${var.stage}-Policy"
#   origin_access_control_origin_type = "s3"
#   signing_behavior                  = "always"
#   signing_protocol                  = "sigv4"
# }

resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "Origin Access Identity for origin: ${local.s3OriginId}"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.website.bucket_domain_name # "${aws_s3_bucket.website.bucket}.s3.amazonaws.com"
    origin_id   = local.s3OriginId                         # var.bucket_name

    # origin_access_control_id = aws_cloudfront_origin_access_control.this.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  aliases = ["${var.domain_name}"]

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.app_name}-${var.stage}"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.s3OriginId # var.bucket_name
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    # compress               = true

    forwarded_values {
      headers      = ["Origin", "Authorization", "Cache-Control", "Content-Type", "Expires"]
      query_string = true

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = data.aws_acm_certificate.ssl_cert.arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
    cloudfront_default_certificate = true
  }

  tags = var.additional_tags
}
