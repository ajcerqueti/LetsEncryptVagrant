#!/bin/bash

show_usage() {
    echo -e "Usage: $0 [domain] [s3_bucket] [cloudfront_distribution_id]"
    echo ""
}

if [ "$#" -ne 3 ]; then
    show_usage
    exit 1
fi

cd ~/letsencrypt/
source venv/bin/activate

# create certificate
DOMAIN=$1
S3_BUCKET=$2
DISTRIBUTION_ID=$3
sudo letsencrypt --agree-tos -a letsencrypt-s3front:auth --letsencrypt-s3front:auth-s3-bucket $S3_BUCKET -i letsencrypt-s3front:installer --letsencrypt-s3front:installer-cf-distribution-id $DISTRIBUTION_ID -d $DOMAIN

deactivate