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

Configuration
-------------
Copy ```/vagrant/config.yml.dist``` to ```/vagrant/config.yml```

Follow the example configuration. You'll need your AWS creds, know your bucket region, plus a list of your distributions.

For each distribution:

```Domain name``` is your CNAME (cdn.example.com)

```S3 bucket``` is your AWS S3 bucket

```Cloudfront distribution ID``` is the AWSCloudFront Distribution ID (EXXXXXXEXAMPLE)

Configure AWS CLI by running
```
cd /vagrant
./aws_configure.sh
```

Make sure the CNAME is pointing to the CloudFront URL (dxxexample.cloudfront.net), and is listed as an alias inside the distribution.

Generating certificates
-----------------------
Run
```
cd /vagrant
./generate_letsencrypt_cloudfront.sh
```

This will iterate through your distributions, generating and uploading a new certificate where needed.
