# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
#  config.vm.network :forwarded_port, guest: 22, host: 2250
  config.vm.define "dockersandbox" do |dockersandbox|
    dockersandbox.vm.hostname = "dockersandbox"
    dockersandbox.vm.box = "trusty-server"
    dockersandbox.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
    dockersandbox.vm.network :private_network, ip: "10.180.0.30", :netmask => "255.255.255.0"
    dockersandbox.vm.provision :shell, :path => "build.sh"
  end
end