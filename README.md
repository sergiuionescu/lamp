lamp
====
Install and configures the following services:
- apache(mod_proxy)
- php-fpm
- mysql

Additional sevices/tools:
- vim
- sendmail
- git client
- composer

Basic lamp machine with Berkshelf Chef and Vagrant support
* Master: [![Build Status](https://api.travis-ci.org/sergiuionescu/lamp.svg?branch=master)](http://travis-ci.org/sergiuionescu/lamp)
* Dev: [![Build Status](https://api.travis-ci.org/sergiuionescu/lamp.svg?branch=dev)](http://travis-ci.org/sergiuionescu/lamp)

Adds optional xdebug and nfs share capabilities

Requirements(prod)
------------------
* chef-solo: https://downloads.chef.io/chef-client/
* berkshelf: http://berkshelf.com/

Requierments(dev)
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
- install basic lamp services
- create a nfs share of /var/www
- install xdebug - you need to manually set remote_enable=1
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
