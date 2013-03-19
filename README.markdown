Install
=======

You can install the distribution by cloning the project:

    git clone git://github.com/iostudio/symfony-distribution.git /var/www/app.local
    cd /var/www/app.local
    ./bootstrap.sh
    vagrant up

Or you can use composer's `create-project` command:

    composer.phar create-project iostudio/symfony-distribution /var/www/app.local -s dev
    cd /var/www/app.local
    ./bootstrap.sh
    vagrant up

The recommended may to install this distribution is to use the `create-project`
program.

## Configure

All the configuration files are located in the `app/config` directory.

The main configuration file is `parameters.yml`.

## Database

The database is running on the VM that was created by
vagrant. You will need to run `vagrant ssh` and then
change directories to `/var/www/app.local` to run these
commands on that VM.

    php app/console doctrine:database:create
    php app/console doctrine:schema:update --force

**NOTE** You will need to run `vagrant ssh` to setup and configure the
database.

## Sass (front end)

Open fresh terminal window in the background

    cd ~/project directory
    compass watch web

If you don't have Sass & Compass at all

    sudo gem update --system
    sudo gem install compass
    sudo gem install zurb-foundation

config.rb is located in the project root directory
so you can run `compass compile` or anything else in
this directory.
    
## Vagrant

Vagrant has been added for your convenience. Please run `vagrant up`
on the command line to boot your server. When you are done, please run
`vagrant destroy` or one of the other vagrant commands to shut the VM
down.

## Puppet

All of the puppet files can be found in `app/Resources/puppet`. This includes
the manifest files and modules. Modules should be git submodules. There is no
need to check any of these in since they are used on multiple projects.

You can find modules at http://forge.puppetlabs.com/puppetlabs

## Deployment

Deployment is done using [Capifony](http://capifony.org/). You must edit the
deployment files, see `app.config/deploy.rb`, `app/config/deploy/beta.rb`, and
`app/config/deploy/production.rb` for information on configuring deployments.

Before you make your first deploy, you must run `cap STAGE deploy:setup` to make
sure that the directory structure is correct. Once that is complete, you can just
run `cap STAGE deploy`.

Combine them both in one step: `cap STAGE deploy:setup deploy`

**NOTE**: STAGE will either be beta or production. This relates to the deployment
setting files in `app/config/deploy`.

## List of files that need edits

When setting up a new project, these files will need to be edited so
that the application can be deployed or just generally setup.

* app/config/deploy/beta.rb
* app/config/deploy/production.rb
* app/config/deploy.rb
* app/config/parameters.beta.yml
* app/config/parameters.production.yml
* app/config/parameters.yml
* composer.json
* sami.php

Run `git grep ":EDIT:"` to get a list of what needs to be edited. This
will however exclude composer.json, so DO NOT FORGET to update that file.

## Testing

WARINING: This is destructive to your database.

To run tests you must have `ant` installed on your machine. To begin
the build, run the `ant` command. There are other tasks that can be run
such as building documentation, but those are not included in the main
build. You will also need to have phpunit and some other tools installed
on your machine in order to use this.

Also note, that this is the command that is run on Jenkins so if you want
to see if your code is working, then this is how you do it.

## Documentation

You can generate documentation based on docBlocks using Sami. View
`sami.php` and check out https://github.com/fabpot/Sami

