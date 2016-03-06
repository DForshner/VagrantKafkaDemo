# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Configure box
  config.vm.box = "ubuntu/trusty64"

  # Forward kafka port
  config.vm.network "forwarded_port", guest: 9092, host: 9092
  
  # Forward zookeeper port
  config.vm.network "forwarded_port", guest: 2181, host: 2181

  # Provider-specific configuration
  config.vm.provider "virtualbox" do |vb|

    # Customize the amount of memory on the VM
    vb.memory = "2024"

  end

  # Provisioning
  config.vm.provision "shell", path: "vagrant/provision.bash"

end
