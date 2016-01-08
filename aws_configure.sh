#!/usr/bin/env bash

# generate AWS config and credentials files
cd ~
echo "Type your AWS access key ID, followed by [ENTER]:"
read aws_access_key_id
echo "Type your AWS secret access key, followed by [ENTER]:"
read aws_secret_access_key
echo "Type your AWS S3 bucket region , followed by [ENTER]:"
read region
mkdir -p .aws
echo -e "[default]\naws_access_key_id=$aws_access_key_id\naws_secret_access_key=$aws_secret_access_key" > .aws/credentials
echo -e  "[default]\nregion=$region" > .aws/config