Install
=======

1) clone repo
2) run `./bootstrap.sh`
3) edit `app/config/parameters.yml` in your favorite editor
4) profit

Configure
---------

Edit the file app/config/parameters.yml file
1) set up database name
2) add your mysql username & password 
    u: root, p: root (or no password) by default

Database
--------

php app/console doctrine:database:create
php app/console doctrine:schema:update --force

Sass (front end)
--------

Open fresh terminal window in the background
    cd ~/project directory
    compass watch web

If you don't have Sass & Compass at all
    sudo gem update --system
    sudo gem install compass
    sudo gem install zurb-foundation
    
Vagrant
-------

Vagrant has been added for your convenience. Please run `vagrant up`
on the command line to boot your server. When you are done, please run
`vagrant destroy` or one of the other vagrant commands to shut the VM
down.

Puppet
------

All of the puppet files can be found in `app/Resources/puppet`. This includes
the manifest files and modules. Modules should be git submodules. There is no
need to check any of these in since they are used on multiple projects.

You can find modules at http://forge.puppetlabs.com/puppetlabs

List of files that need edits
-----------------------------

* app/config/deploy/beta.rb
* app/config/deploy/production.rb
* app/config/parameters.yml
* bootstrap.sh

Testing
-------

WARINING: This is destructive to your database.

To run tests you must have `ant` installed on your machine. To begin
the build, run the `ant` command. There are other tasks that can be run
such as building documentation, but those are not included in the main
build. You will also need to have phpunit and some other tools installed
on your machine in order to use this.

Also note, that this is the command that is run on Jenkins so if you want
to see if your code is working, then this is how you do it.
