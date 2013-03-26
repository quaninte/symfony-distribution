#!/usr/bin/env bash
####
#
# bootstrap-vagrant.sh
#
# This file is used by vagrant make sure symfony gets setup
# the proper way on the VM.
#
# @TODO Move this stuff to the manifest file
#

# Make sure we are in the vagrant directory, this is a directory
# on the VM
cd /var/www/app.local

# The reason this happens is so there are no issues when
# we try to install assets form bundles
rm -rf web/bundles

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
