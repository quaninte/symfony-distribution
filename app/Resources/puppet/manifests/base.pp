###
#
# This is used to update the packages on the VM, this
# should run before installing things like apache or mysql
#
exec { "apt-get update && apt-get upgrade":
    path      => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/vagrant_ruby/bin",
    command   => "apt-get update && apt-get upgrade -y --fix-missing",
    logoutput => true,
}

###
#
# Make sure git and vim are on the server
#
package { 'git':
    ensure  => present,
}
package { 'vim':
    ensure  => present,
}
package { 'curl':
    ensure  => present,
}

####
#
# Global install of composer
#
exec { "composer":
    path      => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/vagrant_ruby/bin",
    creates   => "/usr/local/bin",
    cwd       => "/usr/local/bin",
    logoutput => true,
    command   => "curl -sS https://getcomposer.org/installer | php",
}

###
#
# Setup apache, this may need to be updated for some projects
#
file { "/var/www/app.local/web":
    ensure  => directory,
    #owner   => www-data,
    #group   => www-data,
    recursive => true,
}

# make sure these directories exist and can be used by www-data
file { "/var/www/app.local/app/cache":
    mode => '0777',
}
file { "/var/www/app.local/app/logs":
    mode => '0777',
}

class { "apache": }
class { "apache::mod::php": }
apache::vhost { 'app.local':
    priority   => 000,
    port       => 80,
    servername => 'app.local',
    serveraliases => '*',
    # Vagrant puts all the files in the /vagrant directory,
    # so we want to make sure that the web directory is used
    # as docroot so it picks up app_dev.php and app.php
    docroot    => '/var/www/app.local/web',
    override   => 'All',
    options    => '+FollowSymlinks +MultiViews',
    require    => File["/var/www/app.local/web"]
}

###
#
# Setup mysql
#
class { "mysql": }
class { "mysql::server":
    config_hash => {
        "root_password" => "root"
    }
}
class { "mysql::php": }

####
#
# This will setup a database named "app", you can update
# the user and password to something else
#
mysql::db { 'app':
    user     => "root",
    password => "root",
    host     => $::hostname,
    grant    => ['all']
}
