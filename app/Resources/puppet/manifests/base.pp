###
#
# This is used to update the packages on the VM, this
# should run before installing things like apache or mysql
#
exec { 'apt-get update':
    command   => "/usr/bin/apt-get update",
    logoutput => "on_failure"
}
exec { 'git submodule init':
    command   => "/usr/bin/git submodule init",
    logoutput => "on_failure"
}
exec { 'git submodule update':
    command   => "/usr/bin/git submodule update",
    logoutput => "on_failure",
    require   => Exec['git submodule init']
}

###
#
# Make sure git and vim are on the server
#
package { 'git':
    ensure  => present,
    require => Exec['apt-get update']
}
package { 'vim':
    ensure  => present,
    require => Exec['apt-get update']
}
package { 'curl':
    ensure  => present,
    require => Exec['apt-get update']
}

###
#
# Setup apache, this may need to be updated for some projects
#
file { "/var/www/app.local":
    ensure    => directory,
    owner     => www-data,
    group     => www-data,
}
file { "/var/www/app.local/web":
    ensure  => directory,
    owner   => www-data,
    group   => www-data,
    require => File["/var/www/app.local"]
}
class { "apache":
    require => [Exec['apt-get update'], Exec['git submodule update']]
}
class { "apache::mod::php":
    require => Exec['apt-get update']
}
apache::vhost { 'app.local':
    priority   => 000,
    port       => 80,
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
class { "mysql":
    require => Exec['apt-get update']
}
class { "mysql::server":
    require     => Exec['apt-get update'],
    config_hash => {
        "root_password" => "root"
    }
}
class { "mysql::php":
    require => Exec['apt-get update']
}
