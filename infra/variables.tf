variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-west-2"
}

variable "aws_vpc_name" {
  type        = string
  description = "Add name for your VPC."
  default     = "newput-dev"
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

# variable "ecs_task_execution_role_name" {
#   description = "ECS task execution role name"
#   default = "myEcsTaskExecutionRole"
# }

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 8080
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 1
}

variable "app_name" {
  type        = string
  description = "The application name"
  default     = "node-terraform"
}

variable "health_check_path" {
  default = "/"
}

variable "env_vars" {
  type        = map(string)
  default     = {}
  description = "Map of environment vars to make is easier to pass"
}

variable "secret_arns" {
  type        = map(string)
  default     = {}
  description = "Map of secrets to use in the template"
}

# variable "aws_access_key" {}
# variable "aws_secret_key" {}
# variable "aws_region" {}

variable "domain_name" {}

variable "website_bucket_name" {}
variable "website_zone_id" {}