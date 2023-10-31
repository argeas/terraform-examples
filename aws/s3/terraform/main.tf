terraform {
  required_version = "1.3.6"

  #  required_providers {
  #    aws = {
  #      source = "hashicorp/aws"
  #      version = "4.47.0"
  #    }
  #  }
}

resource "aws_s3_bucket" "s3_bucket" {
  provider = aws.cloudflare
  bucket = "terraform-bucket-1"
}

resource "aws_s3_object" "object" {
  provider = aws.cloudflare
  for_each = fileset("../files/", "**")

  bucket = aws_s3_bucket.s3_bucket.id
  key    = "terraform-test-1/${each.value}"
  source = "../files/${each.value}"

  # etag makes the file update when it changes
  source_hash   = filemd5("../files/${each.value}")

  depends_on = [
    aws_s3_bucket.s3_bucket
  ]

}
