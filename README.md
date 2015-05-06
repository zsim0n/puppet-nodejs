# nodejs

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with nodejs](#setup)
    * [What nodejs affects](#what-nodejs-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with nodejs](#beginning-with-nodejs)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Ran out of time fixing the official [Puppetlabs](https://forge.puppetlabs.com/puppetlabs/nodejs) module. So I come up this Super Simple Module for installing NodeJS with the [Official](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager) method.
It tend to be working on Debian / Ubuntu environment. Somehow latest:

* Mac OS X 10.10.3
* Vagrant 1.7.2
* VirtualBox 4..
* Puppet
* Librarian Puppet
* Ubuntu 14.04


## Module Description


## Setup

### What nodejs affects

* Checks and install `curl`if necessary
* Installs `nodejs`via `apt` 
* Updates `npm`to the latest and configure it to use `/home/vagrant/npm` folder 
* Add `nodejs`pathes to `profile.d`
* Register `npm` provider so you can do the following:

```
package { 'yo':
  ensure => 'present',
  provider => 'npm',
}
```

### Beginning with nodejs

```
class {'nodejs:'}
```

## Usage

```
class {'nodejs:'
    repo_version => '0.10',
}
```

## Reference

npm provider has been reused from [Puppetlabs](https://forge.puppetlabs.com/puppetlabs/nodejs) module.

## Limitations

Tested only on Ubuntu 14.04

## Development

Feel free to use/fork report issues

## Release Notes/Contributors/Etc 

0.1.0 Initial and might be the final release

