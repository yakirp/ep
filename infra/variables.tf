variable "aws_region" {
  default = "us-east-1"
}

variable "lambda_function_name" {
  default = "email_parser_dns_lambda"
}

variable "lambda_role_name" {
  default = "lambda_ses_dns_role"
}

variable "s3_bucket" {
  default = "my-lambda-deploy-bucket-4sdsd6thgr"
}


variable "verify_lambda_file_path" {
  default = "../lambda_packages/check.zip"
}

variable "parser_lambda_file_path" {
  default = "../lambda_packages/parser.zip"
}

variable "aws_account_id" {
  default = "302835751737"
}


variable "domain_name" {
  default = "emailtowebhook.com"
  type        = string
}

variable "subdomain_name" {
  default = "api"
  type        = string
}

variable "certificate_arn" {
   type        = string
   default = "arn:aws:acm:us-east-1:302835751737:certificate/3b5ce796-3a5c-4742-8d98-79d1a42191e9"
}

variable "route53_zone_id" {
    default = "Z06253611H11TYVLSQ89V"
  type = string
}