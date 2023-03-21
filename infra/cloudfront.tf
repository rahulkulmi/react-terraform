# AWS Cloudfront for caching
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${aws_s3_bucket.website.bucket}.s3.amazonaws.com"
    origin_id   = "s3.${var.bucket_name}"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.app_name}-${var.stage}"
  default_root_object = "index.html"

  aliases = ["${var.domain_name}"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3.${var.bucket_name}"

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https" # "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # price_class = "PriceClass_100" # US/EU  edge locations only

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # tags {
  #   Environment = "production"
  # }

  viewer_certificate {
    # cloudfront_default_certificate = true
    acm_certificate_arn      = data.aws_acm_certificate.np.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  tags = var.additional_tags
}