#!/usr/bin/env bash
####
#
# This file is used to bootstrap the host machine, not the VM
#

# Install all submodules
git submodule update --init --recursive

# Download composer
# @see http://getcomposer.org/doc/00-intro.md#installation-nix
curl -sS https://getcomposer.org/installer | php

# Create a parameters.yml file if the file does not exist
if [ ! -f app/config/parameters.yml ]; then
    cp app/config/parameters.dist.yml app/config/parameters.yml
fi

# Install Dependencies
# http://getcomposer.org/doc/01-basic-usage.md#installing-dependencies
php composer.phar install --verbose

