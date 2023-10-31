terraform {
  backend "s3" {
    bucket                  = "cloudflare-r2"
    key                     = "terraform-folder-1/terraform.tfstate"
    region                  = "eu-west-2"
    shared_credentials_file = "~/.aws/credentials"
    encrypt                 = true
    kms_key_id              = "mrk-09d7bc3e7f154cf6a38cf52f8a14f3cb"
  }
}
