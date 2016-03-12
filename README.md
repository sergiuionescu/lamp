lamp
====
Basic lamp machine with Berkshelf Chef and Vagrant support
* Master: [![Build Status](https://api.travis-ci.org/sergiuionescu/lamp.svg?branch=master)](http://travis-ci.org/sergiuionescu/lamp)
* Dev: [![Build Status](https://api.travis-ci.org/sergiuionescu/lamp.svg?branch=dev)](http://travis-ci.org/sergiuionescu/lamp)


Installs and configures the following services:
- apache(mod_proxy)
- php-fpm
- mysql

Additional services/tools:
- vim
- sendmail
- git client
- composer

Adds optional xdebug and nfs share capabilities.
Php7 support via ppa:ondrej/php.


Requirements(prod)
------------------
* chef-solo: https://downloads.chef.io/chef-client/
* berkshelf: http://berkshelf.com/

Requirements(dev)
-----------------
* vagrant: https://www.vagrantup.com/downloads.html
* chef dk: https://downloads.getchef.com/chef-dk/
* virtualbox: https://www.virtualbox.org/wiki/Downloads

Testing the dev environment
---------------------------
- Clone the repository
- Go to the project root
- Run kitchen converge

Recipes
-------
- default - installs basic services
- nfs - installs nfs server and exposes a network share to '/var/www'
- xdebug - installs the php debugger
- phpinfo - recipe that sets up a test web application under '/var/www/phpinfo' - accessing the machine ip will show the phpinfo values

Configuration
-------------
Sample roles

Lamp(production):
- install basic lamp services
``````
{
    "name": "lamp",
    "chef_type": "role",
    "json_class": "Chef::Role",
    "description": "Basic lamp configuration.",
    "run_list": [
        "recipe[lamp]"
    ]
}
``````

Lamp + nsf share + xdebug(dev):
- installs basic lamp services
- creates a nfs share of '/var/www'
- installs xdebug - you need to manually set remote_enable=1
``````
{
    "name": "lamp",
    "chef_type": "role",
    "json_class": "Chef::Role",
    "description": "Basic lamp configuration.",
    "run_list": [
        "recipe[lamp]",
        "recipe[lamp::nfs]",
        "recipe[lamp::xdebug]",
        "recipe[lamp::phpinfo]"
    ],
    "default_attributes": {
        "lamp": {
            "share": {
                "user": "vagrant",
                "group": "vagrant"
            },
            "xdebug": {
                "directives": {
                    "remote_host": "10.0.2.2",
                    "remote_enable": 0,
                    "remote_autostart": 1
                }
            }
        }
    }
}

Sample role with php7 support.

Php 7 is supported via ppa. The are a number of overwrite attributes that need to be set as long with a path for the php cookbook to disable pear and pecl update.
```json
{
    "name": "lamp",
    "chef_type": "role",
    "json_class": "Chef::Role",
    "description": "Basic lamp configuration.",
    "run_list": [
        "recipe[lamp]",
        "recipe[lamp::nfs]"
    ],
    "override_attributes": {
        "php": {
            "version": "7.0",
            "conf_dir": "/etc/php/7.0/cli",
            "packages": [
                "php7.0-cgi",
                "php7.0",
                "php7.0-dev",
                "php7.0-cli",
                "php7.0-json",
                "php7.0-curl",
                "php-pear"
            ],
            "mysql": {
                "package": "php7.0-mysql"
            },
            "fpm_package": "php7.0-fpm",
            "fpm_pooldir": "/etc/php/7.0/fpm/pool.d",
            "fpm_service": "php7.0-fpm",
            "fpm_default_conf": "/etc/php/7.0/fpm/pool.d/www.conf"
        }
    }
}
```