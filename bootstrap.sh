#!/usr/bin/env bash
####
#
# This file is used to bootstrap the host machine, not the VM
#

# Install all submodules
git submodule update --init --recursive

# Download composer
curl -sS https://getcomposer.org/installer | php

# Install vendors
php composer.phar install --verbose

