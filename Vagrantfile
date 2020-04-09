Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
  config.disksize.size = '50GB'
  config.vm.box_url = "http://cloud.centos.org/centos/8/x86_64/images/CentOS-8-Vagrant-8.1.1911-20200113.3.x86_64.vagrant-virtualbox.box"
  config.vm.hostname = "myhost"
  config.vm.network "private_network", ip: "192.168.50.10"
  config.vm.provision "shell", path: "script.sh"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = "true"
    vb.memory = "4096"
    vb.cpus = "4"
  end
end
