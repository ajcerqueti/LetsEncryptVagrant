# LetsEncryptVagrant
A Vagrant box for automating Let's Encrypt SSL certificate generation and deployment

## Purpose
Security on the web has never been more important. We're taking steps to migrate to HTTPS by default, and thanks to projects like [Let's Encrypt](https://letsencrypt.org/), this should be easy and free. 

At Square Up Media, we love AWS. We aim to have all of our assets stored on S3 and served through CloudFront, but want to obfuscate AWS URLs wherever possible with pretty CNAMEs belonging to our brand domains.
Unfortunately, that breaks CloudFront's SSL certificates, but thankfully, CloudFront allows you to provide an alternative certificate for any aliases.
This box was created to automate (or at least, initially, to script) that process so we can deploy and configure certificates across our CloudFront distributions for all our brands.

None of this would be possible without Let's Encrypt, or the excellent plugin [dlapiduz/letsencrypt-s3front](https://github.com/dlapiduz/letsencrypt-s3front)

## Requirements
You need to have VirtualBox and Vagrant installed. Everything else is inside the VM. 

## Installation
Standard for Vagrant. We just launch a VM using: ```vagrant up```, then ssh into the box: ```vagrant ssh```.

Any issue can probably be fixed with a quick ```vagrant provision```.


Generating certificates for CloudFront CNAMEs
---------------------------------------------
Configure AWS CLI by running ```/vagrant/aws_configure.sh```

After that, you can generate SSL certs from Let's Encrypt, and put them in place for a CNAME on AWS CloudFront using the ```/vagrant/generate_letsencrypt_cloudfront.sh``` script:

```shell
/vagrant/generate_letsencrypt_cloudfront.sh [domain] [s3_bucket] [cloudfront_distribution_id]
```

where ```domain``` is your CNAME (cdn.example.com), ```s3_bucket``` is your AWS S3 bucket, and ```cloudfront_distribution_id``` is the AWSCloudFront Distribution ID (EXXXXXXEXAMPLE).

Make sure the CNAME is pointing to the CloudFront URL (dxxexample.cloudfront.net) first, and it listed as an alias inside the distribution.
