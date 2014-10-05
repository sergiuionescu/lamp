lamp
====

Basic lamp machine with Berkshelf Chef and Vagrant support


Requierments
------------
* chef-solo: tested on 11.8.2
* berkshelf: tested on 3.1.5

Extra develpment requierments
-----------------------------
* vagrant >= 1.5.2
* vagrant-berkshelf (vagrant plugin install vagrant-berkshelf)
* chef dk >= 0.2.0
* virtualbox: tested on 4.1.14
 

Resources links
---------------
* Chef DK(includes Berkshelf): https://downloads.getchef.com/chef-dk/
* Vagrant: https://www.vagrantup.com/downloads.html
* Virtualbox: https://www.virtualbox.org/wiki/Downloads


How to test dev environment
---------------------------
- Clone the repository
- Go to the project root
- Run "vagrant up"

How to test in production
-------------------------
@TODO

How to use
----------
@TODO

Final notes
-----------
The Vagrantfile and lamp.json roles are for demo purposes only. 
Please create your own, i am sure they are not perfect examples.
The role lamp.json does not set a password to the mysq root user - avoid using this in production.

Todos
------
- The Mysql cookbook version is frozen at 3.0.4, the latest version seems to have issues on Ubuntu 14.04. Need to see if newer versions can be supported
- Set up some Travis test cases. Test that all services are installed an running.
