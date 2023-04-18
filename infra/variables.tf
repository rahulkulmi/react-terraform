variable "region" {
  description = "The AWS region things are created in"
  default     = "us-west-2"
}

# variable "dns_role" {
#   default = "arn:aws:iam::708980201424:role/newput-dev-Route53FullAccess"
# }

variable "access_key" {
  description = "My AWS access key"
}

variable "secret_key" {
  description = "My AWS secret key"
}

## Tag variables
variable "repo" {
  type    = string
  default = "react-terraform"
}

variable "project" {
  type    = string
  default = "Newput"
}

variable "app_name" {
  type        = string
  description = "The application name"
  default     = "react-terraform"
}

variable "app_version" {
  type        = string
  default     = "Working on it"
  description = "Version of the application"
}

variable "stage" {
  type    = string
  default = "dev"
}
# End tag vars

variable "bucket_name" {
  type        = string
  description = "The name of the bucket without the www. prefix. Normally domain_name."
  default     = "newput-react-web-dev"
}

variable "domain_name" {
  type        = string
  description = "The domain name for the website."
  default     = "dev.newput.click"
}

variable "record_name" {
  type        = string
  default     = "dev.app.codeuncode.in"
  description = "Name of the DNS record"
}

variable "certificate_name" {
  default = "*.newput.click"
}

variable "hosted_zone_name" {
  default = "newput.click."
}

variable "custom_error_response" {
  default = [{
    error_caching_min_ttl = 0
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }]
}
