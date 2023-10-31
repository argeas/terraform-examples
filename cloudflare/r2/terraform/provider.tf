terraform {
  required_version = "1.3.6"

#  required_providers {
#    aws = {
#      source = "hashicorp/aws"
#      version = "4.20.1"
#    }
#  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  skip_credentials_validation = true
  skip_region_validation = true
  skip_requesting_account_id = true
  region="us-east-1"
  endpoints {
    s3 = var.r2_endpoint
  }
  alias="cloudflare"
}

#provider "aws" {
#  access_key = var.access_key
#  secret_key = var.secret_key
#  skip_credentials_validation = true
#  skip_region_validation = true
#  skip_requesting_account_id = true
#  region="eu-west-2"
#
#  alias="aws"
#}