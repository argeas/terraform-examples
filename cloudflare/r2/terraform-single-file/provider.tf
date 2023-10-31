terraform {
  required_version = "1.3.6"

#  required_providers {
#    aws = {
#      source = "hashicorp/aws"
#      version = "4.47.0"
#    }
#  }
}

provider "aws" {
  access_key = var.r2_access_key
  secret_key = var.r2_secret_key
  skip_credentials_validation = true
  skip_region_validation = true
  skip_requesting_account_id = true
  region="us-east-1"
  endpoints {
    s3 = var.r2_endpoint
  }
  alias="cloudflare"
}