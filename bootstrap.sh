#!/usr/bin/env bash
####
#
# bootstrap.sh - This file is used to bootstrap your project.
# Once you clone this project, you should run this script and
# it will set up your database and anything else in the project
#

# Create a parameters.yml file
cp app/config/parameters.dist.yml app/config/parameters.yml

# Download composer
curl -sS https://getcomposer.org/installer | php

# Install vendors
php composer.phar install --verbose
