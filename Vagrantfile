Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-8"
  config.disksize.size = '100GB'
  config.vm.hostname = "myhost"
  config.vm.network "private_network", ip: "192.168.50.10"
  config.vm.provision "shell", path: "script.sh"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = "true"
    vb.memory = "8192"
    vb.cpus = "4"
  end
end
