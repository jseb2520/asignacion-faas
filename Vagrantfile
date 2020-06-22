Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", type: "dhcp"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 8001, host: 8001
  config.vm.provision "shell", path: "./installation-scripts/install-asciinema.sh"
  config.vm.provision "shell", path: "./installation-scripts/install-docker.sh"
  config.vm.provision "shell", path: "./installation-scripts/install-gcloud.sh"
  config.vm.provision "shell", path: "./installation-scripts/install-tools.sh", privileged: false
  config.vm.provision "shell", path: "./installation-scripts/install-kubectl.sh", privileged: false
  config.vm.provision "shell", path: "./installation-scripts/install-inlets.dev.sh", privileged: false
  config.vm.provider :virtualbox do |vb|
    vb.customize [ 'modifyvm', :id, '--name', 'faas-gcp' ]
    vb.memory = 2048
    vb.cpus = 2
  end
end

