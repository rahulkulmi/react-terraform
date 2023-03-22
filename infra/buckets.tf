# S3 bucket for website.
# resource "aws_s3_bucket" "www_bucket" {
#   bucket = "www.${var.bucket_name}"
#   acl    = "public-read"
#   policy = templatefile("templates/s3-policy.json", { bucket = "www.${var.bucket_name}" })

#   cors_rule {
#     allowed_headers = ["Authorization", "Content-Length"]
#     allowed_methods = ["GET", "PUT", "POST"]
#     allowed_origins = ["https://www.${var.domain_name}"]
#     max_age_seconds = 3000
#   }

#   website {
#     index_document = "index.html"
#     error_document = "index.html"
#   }

#   tags = var.additional_tags
# }

# # S3 bucket for redirecting non-www to www.
# resource "aws_s3_bucket" "root_bucket" {
#   bucket = var.bucket_name
#   acl    = "public-read"
#   policy = templatefile("templates/s3-policy.json", { bucket = var.bucket_name })

#   website {
#     redirect_all_requests_to = "https://www.${var.domain_name}"
#   }

#   tags = var.additional_tags
# }


# AWS S3 bucket for static hosting
resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy = templatefile("templates/s3-policy.json", { bucket = var.bucket_name })

  cors_rule {
    allowed_headers = ["*"] # ["Authorization", "Content-Length"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"] # ["https://www.${var.domain_name}"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = var.additional_tags
  #   tags {
  #     Name        = "Website"
  #     Environment = "production"
  #   }
}

# AWS S3 bucket for www-redirect
# resource "aws_s3_bucket" "website_redirect" {
#   bucket = "www.${var.bucket_name}"
#   acl    = "public-read"

#   website {
#     redirect_all_requests_to = var.bucket_name
#   }
# }
