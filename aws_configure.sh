#!/bin/bash
echo ""

# Check config.yml exists"
CONFIG_FILE="/vagrant/config.yml"
if [ ! -f $CONFIG_FILE ];
then
	echo "File $CONFIG_FILE does not exist. Exiting..."
	exit
fi

# Get AWS config
AWS_ACCESS_KEY="$(cat $CONFIG_FILE | shyaml get-value config.aws_access_key)"
AWS_SECRET_ACCESS_KEY="$(cat $CONFIG_FILE | shyaml get-value config.aws_secret_access_key)"
S3_BUCKET_REGION="$(cat $CONFIG_FILE | shyaml get-value config.aws_s3_bucket_region)"

mkdir -p ~/.aws
echo -e "[default]\naws_access_key_id=$AWS_ACCESS_KEY\naws_secret_access_key=$AWS_SECRET_ACCESS_KEY" > ~/.aws/credentials
echo -e "[default]\nregion=$S3_BUCKET_REGION" > ~/.aws/config