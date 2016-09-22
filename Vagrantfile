# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = "ubuntu/xenial32"
  config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
  config.vm.provision :shell, path: "provision-root.sh"
  config.vm.provision :shell, path: "provision-user.sh", privileged: false
  config.vm.provision :shell, path: "provision-gems.sh", privileged: true
  config.vm.network :forwarded_port, guest: 3000, host: 3000
end
