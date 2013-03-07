#!/usr/bin/env bash
####
#
# bootstrap.sh - This file is used to bootstrap your project.
# Once you clone this project, you should run this script and
# it will set up your database and anything else in the project
#

# Make sure we are in the vagrant directory
cd /var/www/app.local

# Make sure the submodules are where they need to be
git submodule init
git submodule update

# Create a parameters.yml file if the file does not exist
if [ ! -f app/config/parameters.yml ]; then
    cp app/config/parameters.dist.yml app/config/parameters.yml
fi

# Make sure these directories exist and apache can write to them
mkdir -p app/{cache,logs}
chmod -R 0777 app/{cache,logs}

# The reason this happens is so there are no issues when
# we try to install assets form bundles
rm -rf web/bundles

# Download composer
curl -sS https://getcomposer.org/installer | php

# Install vendors
php composer.phar install --verbose

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