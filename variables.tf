variable "aws_region" {
  default = "us-east-1"
}

variable "site_bucket" {
  description = "Name of the S3 bucket for static website hosting"
  type        = string
}
