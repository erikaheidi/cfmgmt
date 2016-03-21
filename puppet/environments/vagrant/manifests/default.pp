$doc_root = "/var/www/example"

#executes apt-get update
exec { 'apt-get update':
  command => '/usr/bin/apt-get update'
}

#install Apache
package { 'apache2':
  ensure  => "installed",
  require => Exec['apt-get update']
}

#create doc root directory
file { $doc_root:
  ensure => "directory",
  owner => "www-data",
  group => "www-data",
  mode => "644"
}

#copy index html file
file { "$doc_root/index.html":
    ensure => "present",
    source => "puppet:///modules/main/index.html",
    require => File[$doc_root]
}

#set vhost template
file { "/etc/apache2/sites-available/000-default.conf":
    ensure => "present",
    content => template("main/vhost.erb"),
    notify => Service['apache2'],
    require => Package['apache2']
}

#define the Apache service
service { 'apache2':
    ensure => running,
    enable => true
}