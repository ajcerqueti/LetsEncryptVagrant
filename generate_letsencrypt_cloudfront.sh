#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo ""

# Check config.yml exists"
CONFIG_FILE="$DIR/config.yml"
if [ ! -f $CONFIG_FILE ];
then
	echo "File $CONFIG_FILE does not exist. Exiting..."
	exit
fi

# Get AWS config
AWS_ACCESS_KEY="$(cat $CONFIG_FILE | shyaml get-value config.aws_access_key)"
AWS_SECRET_ACCESS_KEY="$(cat $CONFIG_FILE | shyaml get-value config.aws_secret_access_key)"

# Iterate through distributions, run letsencrypt, upload cert to AWS
cat $CONFIG_FILE | shyaml get-values-0 config.distributions | while read -r -d $'\0' DISTRIBUTION_STRUCT; do
    arr=($DISTRIBUTION_STRUCT)
    DOMAIN_NAME="$(echo ${arr[0]})"
    ORIGIN="$(echo ${arr[1]})"
    DISTRIBUTION_ID="$(echo ${arr[2]})"
    sudo AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY" AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" letsencrypt --agree-tos --keep-until-expiring -a letsencrypt-s3front:auth --letsencrypt-s3front:auth-s3-bucket $ORIGIN -i letsencrypt-s3front:installer --letsencrypt-s3front:installer-cf-distribution-id $DISTRIBUTION_ID -d $DOMAIN_NAME
done

# Finished
echo ""
echo "All distributions processed"
echo ""