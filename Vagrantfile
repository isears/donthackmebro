# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian/stretch64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.name = "donthackmebro"
    vb.cpus = 2
    vb.gui = true
  end

  config.vm.synced_folder "~/CTFs", "/home/vagrant/CTFs"
  config.vm.provision "shell", path: "provision.sh"

end
