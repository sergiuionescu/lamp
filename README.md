lamp
====

Basic lamp machine with Berkshelf Chef and Vagrant support
* Master: [![Build Status](https://api.travis-ci.org/sergiuionescu/lamp.svg?branch=master)](http://travis-ci.org/sergiuionescu/lamp)
* Dev: [![Build Status](https://api.travis-ci.org/sergiuionescu/lamp.svg?branch=dev)](http://travis-ci.org/sergiuionescu/lamp)

Adds optional xdebug and nfs share capabilities

Requirements
------------
* chef-solo: tested on 11.8.2
* berkshelf: tested on 3.1.5

Extra development requirements
-----------------------------
* vagrant >= 1.5.2
* chef dk >= 0.2.0
* virtualbox: tested on 4.1.14
* vagrant-berkshelf (vagrant plugin install vagrant-berkshelf) - Optional, kitchen converge can be used to launch the vm instead of vagrant up

Resources links
---------------
* Chef DK(includes Berkshelf): https://downloads.getchef.com/chef-dk/
* Vagrant: https://www.vagrantup.com/downloads.html
* Virtualbox: https://www.virtualbox.org/wiki/Downloads


How to test dev environment
---------------------------
- Clone the repository
- Go to the project root
- Run kitchen converge (or "vagrant up" if you wish to use vagrant-berkshelf)
Note: apache needs to started manually at this point.

How to use
----------
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
    ],
    "default_attributes": {
        "apache": {
            "mpm": "worker"
        },
        "mysql": {
            "server_root_password": "somerandompass",
            "server_repl_password": "somerandompass",
            "server_debian_password": "somerandompass"
        }
    }
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
        "recipe[lamp::xdebug]"
    ],
    "default_attributes": {
        "apache": {
            "mpm": "worker"
        },
        "mysql": {
            "server_root_password": "",
            "server_repl_password": "",
            "server_debian_password": ""
        },
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
``````

Final notes
-----------
The Vagrantfile and lamp.json roles are for demo purposes only. 
Please create your own, i am sure they are not perfect examples.
The role lamp.json does not set a password to the mysq root user - avoid using this in production.

Todos
------

