# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vbguest.auto_update = false

  config.vm.box = "boot2docker"
  config.vm.box_url = "https://github.com/ingoclaro/boot2docker-vagrant-box/releases/download/0.4.0/boot2docker.box"

  config.vm.network :forwarded_port, guest: 4243, host: 4243
  config.vm.network :private_network, ip: "172.16.120.10"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
