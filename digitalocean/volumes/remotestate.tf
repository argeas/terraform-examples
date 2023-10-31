terraform {
  backend "s3" {
    endpoint                    = "https://fra1.digitaloceanspaces.com"
    region                      = "us-east-1"
    key                         = "YOUR/FULL/SPACES/PATH/volumes/test-server-volume/terraform.tfstate"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    bucket                      = "YOUR"
    access_key                  = "YOUR"
    secret_key                  = "YOUR"

  }
}
