# LetsEncryptVagrant
A quick little setup cradle for testing Let's Encrypt

We want to be able to create scripts that create certificates, then install them under Nginx for the production server, or install them into AWS for our CloudFront configurations

Requirements
------------
You need to have VirtualBox installed, obvs. Everything else is inside the VM. 

Installation
------------
Super simple, we just launch a VM using:

```
vagrant up
```

Any issue can probably be fixed with a quick ```vagrant provision```

Then ssh into the box ```vagrant ssh```

Configure AWS CLI by running ```/vagrant/aws_configure.sh```

After that, you can generate SSL certs from Let's Encrypt, and put them in place for a CNAME on AWS CloudFront using the ```/vagrant/generate_letsencrypt_cloudfront.sh``` script:

```shell
/vagrant/generate_letsencrypt_cloudfront.sh [domain] [s3_bucket] [cloudfront_distribution_id]
```

where ```domain``` is your CNAME (cdn.example.com), ```s3_bucket``` is your AWS S3 bucket, and ```cloudfront_distribution_id``` is the AWSCloudFront Distribution ID (EXXXXXXEXAMPLE).



