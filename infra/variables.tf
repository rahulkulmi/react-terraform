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

variable "stage" {
  default = "dev"
}

variable "app_name" {
  type        = string
  description = "The application name"
  default     = "react-terraform"
}

### Tag variables
variable "repo" {
  default = "react-terraform"
}

variable "project" {
  default = "Newput"
}

variable "app_version" {
  type        = string
  default     = "Working on it"
  description = "Version of the application"
}

# variable "health_check_path" {
#   default = "/"
# }

variable "bucket_name" {
  type        = string
  description = "The name of the bucket without the www. prefix. Normally domain_name."
  default     = "newput-react-web-dev"
}

# variable "additional_tags" {
#   type        = map(string)
#   default     = {}
#   description = "Non-default tags to apply to resources"
# }

variable "domain_name" {
  # type        = list(string)
  type        = string
  description = "The domain name for the website."
  default     = "dev.newput.click"
  # default = [
  #   "dev.newput.click"
  # ]
}

variable "certificate_name" {
  default = "*.newput.click"
}

variable "hosted_zone_name" {
  default = "newput.click."
}

# variable "aws_access_key" {}
# variable "aws_secret_key" {}
# variable "aws_region" {}
# variable "domain_name" {}
# variable "website_bucket_name" {}
# variable "website_zone_id" {}
