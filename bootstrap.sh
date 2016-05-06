#!/usr/bin/env bash

# update apt
sudo apt-get update
sudo apt-get upgrade -y

# install deps
sudo apt-get install -y git emacs23-nox python-pip  python-dev libffi-dev libssl-dev python-dialog
sudo pip install --upgrade mock setuptools funcsigs letsencrypt letsencrypt-s3front shyaml pyopenssl

# make the aws configuration script executable
chmod +x /vagrant/aws_configure.sh

# make the generation script executable
chmod +x /vagrant/generate_letsencrypt_cloudfront.sh
