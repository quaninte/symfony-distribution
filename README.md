Install
=======

1) clone repo
2) copy app/config/parameters.yml.dist to app/config/parameters.yml
3) if you don't have composer.phar in your project root do: 
    curl -s https://getcomposer.org/installer | php
4) run composer.phar install
5) profit

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
