#!/usr/bin/env bash
####
#
# bootstrap.sh - This file is used to bootstrap your project.
# Once you clone this project, you should run this script and
# it will set up your database and anything else in the project
#

# Make sure we are in the vagrant directory
cd /var/www/app.local

# Create a parameters.yml file
cp app/config/parameters.dist.yml app/config/parameters.yml
mkdir -p app/{cache,logs}
chmod -R 0777 app/{cache,logs}

# The reason this happens is so there are no issues when
# we try to install assets form bundles
rm -rf web/bundles

# Download composer
curl -sS https://getcomposer.org/installer | php

# Install vendors
php composer.phar install --verbose -d="/vagrant" --no-scripts

# Create the database
php app/console doctrine:database:create

####
#
# Populate the database
#
# If the project uses doctrine migrations
#php app/console doctrine:migrations:migrate

# If the project does not use migrations
#php app/console doctrine:schema:update --force

# If the project uses fixtures
#php app/console doctrine:fixtures:load
