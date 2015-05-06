# == Class: nodejs
#
# Full description of class nodejs here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'nodejs':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#

class nodejs {
  $repo_version = $nodejs::params::repo_version,
  
  if ! defined(Package['curl']) {
      package { 'curl':
          ensure  => present,
      }
  }  
  exec {'nodejs-before-install': 
    command => "/usr/bin/curl -sL https://deb.nodesource.com/setup_$repo_version | sudo bash -",
    require => Package['curl'],
  }->
  package { 'nodejs' :
    ensure  => 'present',
  }->
  exec { 'nodejs-after-install':
    command => 'npm install -g npm && sudo npm -g config set prefix /home/vagrant/npm',
  }->
  file { '/etc/profile.d/nodejs-path.sh' :
    ensure  => present,
    mode    => 644,
    content => template('zsim0n-nodejs/templates/nodejs-path.sh.erb'),
    owner   => 'vagrant',
    group   => 'vagrant',
  }
}

