# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = "official-xenial-32"
  config.vm.box_url = "https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-i386-vagrant.box"
  config.vm.provision :shell, path: "provision-root.sh"
  config.vm.provision :shell, path: "provision-user.sh", privileged: false
  config.vm.provision :shell, path: "provision-gems.sh", privileged: false
  config.vm.network :forwarded_port, guest: 3000, host: 3000
end
