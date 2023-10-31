#!/bin/bash

R2_BUCKET_NAME="r2-bucket-test-4"
R2_DESTINATION_FOLDER="terraform-test-1"
SOURCE_PATH="../aws/s3/empty_dir/"
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION="us-east-1"
export R2_BUCKET_ENDPOINT=""

# Check if the user passed the "plan" option
if [ "$1" == "plan" ]; then
  # List the files in the directory
  echo "Listing files in directory:"
  aws s3 ls --endpoint-url ${R2_BUCKET_ENDPOINT} "s3://${R2_BUCKET_NAME}/${R2_DESTINATION_FOLDER}"
  echo "s3 sync dry run:"
  aws s3 sync --endpoint-url ${R2_BUCKET_ENDPOINT} "${SOURCE_PATH}" "s3://${R2_BUCKET_NAME}/${R2_DESTINATION_FOLDER}" --delete --dryrun

  exit_code=$?
  if [ exit_code != 0 ]; then
    echo "exit code:" $exit_code
    exit $exit_code
  fi
  # Exit the script if success
  exit 0
fi

# Check if the user passed the "apply" option
if [ "$1" == "apply" ]; then

  # Sync the local directory with the S3 bucket
  echo "Uploading files to R2 bucket"
  aws s3 sync --endpoint-url ${R2_BUCKET_ENDPOINT} "${SOURCE_PATH}" "s3://${R2_BUCKET_NAME}/${R2_DESTINATION_FOLDER}" --delete

  exit_code=$?
  if [ exit_code != 0 ]; then
    echo "exit code:" $exit_code
    exit $exit_code
  fi
  # Exit the script if success
  exit 0
fi
