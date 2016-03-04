# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Configure box
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "vagrant-kafka-demo"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Provider-specific configuration
  config.vm.provider "virtualbox" do |vb|

    # Customize the amount of memory on the VM
    vb.memory = "2024"

  end

  # Provisioning
  config.vm.provision "shell", path: "vagrant/provision.bash"

end
