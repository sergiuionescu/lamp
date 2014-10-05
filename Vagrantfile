# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
      config.berkshelf.enabled = true
end

Vagrant::Config.run do |config|

  config.vm.box = "trusty64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # config.vm.boot_mode = :gui

  config.vm.network :hostonly, "192.168.3.3"

  # config.vm.forward_port 80, 8080

  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder "v-data", "/vagrant", "./"

  config.vm.provision :chef_solo do |chef|
    chef.roles_path = "roles"
    chef.add_role "lamp"
  end

end
