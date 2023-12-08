# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<-SCRIPT
wget https://apt.puppetlabs.com/puppet8-release-jammy.deb
dpkg -i puppet8-release-jammy.deb
apt-get update -y
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end
  config.vm.provision "shell", privileged: true, inline: $script
  config.vm.network 'forwarded_port', guest: 8080, host:  8080

  config.vm.provision :hosts do |provisioner|
    provisioner.add_host "10.0.0.10", ['puppet']
  end

  config.vm.define :puppet do |puppet|
    puppet.vm.network :private_network, ip: "10.0.0.10"
    puppet.vm.provision "shell", privileged: true, path: 'provisioning.sh'
    puppet.vm.provider :virtualbox do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  end

  
  # config.vm.define "node-1" do |node|
  #   node.vm.provision "shell", privileged: true, inline: $agent
  #   node.vm.provision "puppet" do |puppet|
  #     puppet.environment_path = "environments"
  #     puppet.environment = "default"
  #     puppet.module_path = 'puppet/modules'
  #   end
  # end
end