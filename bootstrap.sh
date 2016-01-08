#!/usr/bin/env bash

# update apt
sudo apt-get update

# install git
sudo apt-get install git emacs23-nox -y

# install letsencryot
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
./bootstrap/install-deps.sh
# ./bootstrap/ubuntu.sh
./bootstrap/dev/venv.sh

# start virtualenv
source ./venv/bin/activate
git clone https://github.com/dlapiduz/letsencrypt-s3front.git
cd letsencrypt-s3front
python setup.py install
deactivate

# make the generation script executable
chmod +x /vagrant/generate_letsencrypt_cloudfront.sh

# make the aws configuration script executable
chmod +x /vagrant/aws_configure.sh