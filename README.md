Install
=======

1) clone repo
2) copy app/config/parameters.yml.dist to app/config/parameters.yml
3) run composer.phar install
4) profit

Configure
---------

Edit the file app/config/parameters.yml file

Database
--------

    php app/console doctrine:database:create
    php app/console doctrine:schema:update --force
